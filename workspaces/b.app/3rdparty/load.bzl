def declare_maven(item):
  sha = item.get("sha1")
  if sha != None:
     # Note JJ : --> Here the "Cannot redefine repository after any load statement in the WORKSPACE file" error message
     native.maven_jar(name = item["name"], artifact = item["artifact"], sha1 = sha)
  else:
    native.maven_jar(name = item["name"], artifact = item["artifact"])
  native.bind(name = item["bind"], actual = item["actual"])
