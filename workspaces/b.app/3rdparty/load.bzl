def declare_maven(item):
  sha = item.get("sha1")
  if native.existing_rule(item["name"]) == None: # verify if maven_jar is already defined to avoid repository redefinitions with the same maven_jar name
    if sha != None:
      native.maven_jar(name = item["name"], artifact = item["artifact"], sha1 = sha)
    else:
      native.maven_jar(name = item["name"], artifact = item["artifact"])
    native.bind(name = item["bind"], actual = item["actual"])
  else:
    print ("TODO JJ : Skipped rule name " + item["name"] + " for maven artifact " + item["artifact"])
