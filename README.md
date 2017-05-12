# Bépo Layout Generator

## How to use it

### Using the `generate` command (requires Docker)

It is the simplest way to generate the layouts as a single command is required to do everything.

Note: If Docker is not installed, the command will ask if you want to install it.

Example: generate the layouts in the `exported_layouts` directory.

```
./generate exported_layouts
```

Command parameters:

```
Usage: ./generate [-hcd] [-i DOCKER_IMAGE] <EXPORT_DIRECTORY>

    -h              Display this help screen and exit.
    -c              Remove the containers and images created by the script.
    -d              Verbose output for debugging purposes.
    -i DOCKER_IMAGE Change the default Docker image to another one (useful for debugging).
```

### Using the Docker image directly (advanced users)


You need to run this container with a mounted volume to export the generated keyboard layouts:

```sh
mkdir bepo_layouts
docker run -v `pwd`/bepo_layouts:/export bpierre/bepo
```

You can also run your own version of the project by mounting the `/pilotes` directory:

```sh
git clone https://git.tuxfamily.org/dvorak/pilotes.git/ bepo_pilotes
cd bepo_pilotes
mkdir bepo_layouts
docker run -v `pwd`:/pilotes -v `pwd`/bepo_layouts:/export bpierre/bepo
```

### Manually

You can find the official documentation on the wiki: http://bepo.fr/wiki/ConfigGenerator

### License

All the files are available under the terms of the GFDL or the CC-SA-BY licenses.
See GFDL.txt and CC-SA-BY.txt for more details.
