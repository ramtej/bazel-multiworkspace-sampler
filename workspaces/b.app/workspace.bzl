load("//3rdparty:dependencies.bzl", "maven_dependencies")
load("//3rdparty:load.bzl", "declare_maven")

def b_app():
  print ("Loading [b.app]")
  maven_dependencies(declare_maven)
