local home = os.getenv('HOME')
return {
  init_options = {
    cache = {
      directory = home .. "/.ccls-cache",
      retainInMemory = 0,
    };
    compilationDatabaseDirectory = "build";
    index = {
      threads = 4;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
    highlight = {
      lsRanges = true,
    }
  }
}
