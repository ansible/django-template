[![Build Status](https://travis-ci.org/ansible/nginx-container.svg?branch=master)](https://travis-ci.org/ansible/nginx-container)

#nginx-container 

Adds an nginx service to your [Ansible Container](https://github.com/ansible/ansible-container) project. Run the following commands
to install the service:

```
# Set the working directory to your Ansible Container project root
$ cd myproject

# Install the service
$ ansible-container install ansible.nginx-container
```

## Requirements

- [Ansible Container](https://github.com/ansible/ansible-container)
- An existing Ansible Container project. To create a project, simply run the following:
    ```
    # Create an empty project directory
    $ mkdir myproject

    # Set the working directory to the new directory
    $ cd myproject

    # Initialize the project
    $ ansible-contiainer init
    ```

## Role Variables

STATIC_ROOT: /static
> Path to static content to be served by nginx.

PIDFILE_DIR: /run/nginx
> Path where nginx will store the current PID value. 

ASSET_PATHS: []
> List of paths from which static content will be copied. Content will be copied to {{ STATIC_ROOT }}. 

> *NOTE* paths must be valid within the Ansible build container. If you're copying source files, mount the source
  directory to the build container using --with-volumes.

PROXY: no
> When using this role as part of the demo app, nginx needs to proxy the django service, in which case set this to 'yes'. 

PROXY_PASS: "" 
> The address of the backend server accepting the proxied requests. For example: `http://django:8080` 

PROXY_LOCATION: ""
> A string containing an optional modifier and a matching pattern. Requests that contain the matching pattern are forwarded to the PROXY_PASS address. For example,`~* /(api|static)` will forward requests that start with `/api` ro `/static`.  

## Dependencies

None.

## Contributing

For convenience, as you're working on changes to this role, you can test by using the following workflow:

```
# Commit your changes
$ git commit -m

# Push your changes 
$ git push 

# Set the working directory to tests
$ cd tests 

# Run a build that installs the role at the most recent commit 
$ ./build.sh
```

A couple of notes:

- You must `git push` your changes in order for the build to pick them up.
- Modify build.sh to point to your fork of this role.
- If all goes well, and the build succeeds, the container built from your latest commit will be running in the background.
- The running container will publish port 8000:8000, so if you point a browser to [http://localhost:8000](http://localhost:8000), you should see the dfault nginx page .

## License

Apache v2

## Author Information

See [AUTHORS](./AUTHORS) for a list of contributors. Thanks everyone!
