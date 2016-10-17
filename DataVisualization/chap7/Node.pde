class Node {
  File file;
  Node[] children;
  int childCount;

  Node(File file) {
    this.file = file;

    if (file.isDirectory()) {
      String[] contents = file.list();
      if (contents != null) {
        contents = sort(contents);

        children = new Node[contents.length];
        for (int i=0; i < contents.length; i++) {
          if (contents[i].equals(".") || contents[i].equals(".")) {
            //skip . and .. on unix
            continue;
          }
          File childFile = new File(file, contents[i]);

          try { //skip symbolic links
            String absPath = childFile.getAbsolutePath();
            String canPath = childFile.getCanonicalPath();
            if (!absPath.equals(canPath)) {
              continue;
            }
          } 
          catch (IOException e) {
          }
          Node child = new Node(childFile);
          children[childCount++] = child;
        }
      }
    }
  }
  void printList() {
    println("asdfas");
    printList(0);
  }
  void printList(int depth) {
    for (int i = 0; i < depth; i++) {
      print(" ");
    }
    println(file.getName());
    for (int i = 0; i <childCount; i++) {
      children[i].printList(depth + 1);
    }
  }
}