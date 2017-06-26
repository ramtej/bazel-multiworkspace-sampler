def declare_maven(item):
  #print ("callback !")
  #print(__workspace_dir__)
  #print(item)
  sha = item.get("sha1")
  if sha != None:
    native.maven_jar(name = item["name"], artifact = item["artifact"], sha1 = sha)
  else:
    native.maven_jar(name = item["name"], artifact = item["artifact"])
  native.bind(name = item["bind"], actual = item["actual"])
