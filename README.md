# docker-kotlin

[Kotlin](http://kotlinlang.org) docker image based on alpine for local development.

```
# build
docker build -t local/kotlin .

# smaller image size
$ docker images | grep kotlin
local/kotlin    latest  4268b7c38f12    13 minutes ago  118 MB

# enter shell
docker run -it --rm -v $(pwd):/code -w /code local/kotlin sh

$ cat <<EOS > hello.kt
fun main(args: Array<String>) {
    println("Hello, World!")
}
EOS

$ kotlinc hello.kt -include-runtime -d hello.jar
$ java -jar hello.jar
Hello, World!

```