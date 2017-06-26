load("//3rdparty:dependencies.bzl", "maven_dependencies")
load("//3rdparty:load.bzl", "declare_maven")

def a_app():
  print ("Loading [a.app]")
  maven_dependencies(declare_maven)
