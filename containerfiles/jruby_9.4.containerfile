FROM jruby:9.4

ENV GEM_HOME="/gem_home"
ENV PATH="$GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gcc
