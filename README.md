# discourse-embed-complete
Includes the first post in a topic while embedding.

By default embeddding discourse does not include the first post since it was built to reflect a commenting system where most likely the first post is the blog post itself on which the comments are attached.

## Installation
Follow [Discourse's plugin installation guide](https://meta.discourse.org/t/install-a-plugin/19157)

In your app.yml, add
```sh
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - git clone https://github.com/discourse/docker_manager.git
          - git clone https://github.com/arivanandan/discourse-embed-complete.git
```

## Usage
Installing it does the job. Can be toggled from plugin settings.

### Disclaimer
Pretty much spent few hours and did things until it worked. Might be unsafe and might not be the best approach.
