# Bépo Layout Generator

## How to use it

### Docker image

It is the simplest way as all the dependencies are already in the Docker image, so that a single command can be used to generate the layouts.

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
