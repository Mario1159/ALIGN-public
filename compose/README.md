This directory contains a Docker Compose specification that runs the
end-to-end ALIGN flow using a container-based flow, where individual
engines have isolated software environments. 

Software components that are in container images can be thought of as
'installed' and we are using Make to run the flow through the
components.

Using the Makefile, you can invoke the container-based flow using
either a Docker volume for data input/output, or using a directory
(which Docker will mount in each container).  You can also use the
Makefile to either run the ALIGN flow through a native Linux build of
all the components in the current environment (assuming you have all
software prerequisites installed).  

You will need to set two environment variables to run the Makefile in
any environment. First is the ALIGN\_HOME variable which should point
the top directory of the ALIGN analog system.

		% export ALIGN_HOME=<top of ALIGN source area>

Second is a working directory ALIGN\_WORK\_DIR, which can either be
the full path to a working directory or a docker volume name.  

To setup for using a Docker volume in a container-based flow:

		% docker volume create <volumeName>
		% export ALIGN_WORKING_DIR=<volumeName>

To setup ofr using a working directory in a container-based flow using
a working directory. (In WSL, this directory must be the full path to
a Windows shared directory):

		% export ALIGN_WORKING_DIR=<working directory path for output>

Now to invoke the flow:

		% cd $ALIGN_HOME/compose
		% make docker DESIGN=<design>

To rebuild an image (analogous to reinstalling a component), you can
use docker-compose to update the container:

		% cd $ALIGN_HOME/compose
		% docker-compose up -d --build <service-name>

You can work inside the container to modify or debug its behavior:

		% cd $ALIGN_HOME/compose
		% docker-compose exec <service-name> bash
		 $ <start your commands here>
		 $
		
> Here, docker-compose will first bring up a make-docker-service which
> contains the main Makefile and docker-compose configuration.  Then
> it will bring up the rest of the services from within the
> make-docker-service.  After that, make will run the flow for the
> given design.
>
> If the services don't all come up, you can bring down the services
> to retry:

		% make docker-down
		
The second option is to invoke a native Linux environment flow without
using containers, where the same Makefile can be used to issue native
Linux build commands:
	
		% export ALIGN_WORK_DIR=<your Linux working area>
		% cd $ALIGN_WORK_DIR
		% ln -s $ALIGN_HOME/compose/Makefile .
		% make DESIGN=<design>
		
We have provided a Dockerfile in compose/Dockerfile.native that builds
up a monolithic Linux environment to help test the functionality of
operating in a native environment.It is hard to keep it centrally up
to date, so as components add more dependencies, this file may be out
of date.  But it serves as a starting point for the full environment.
The container can be built as a service called fullbuild-service.  You
can then run the above commands in the container:
	
		% cd $ALIGN_HOME/compose
		% docker-compose up -d fullbuild-service
		% docker-compose exec fullbuild-service bash
		 $ cd <a_work_area_inside_container>
		 $ ln -s $ALIGN_HOME/compose/Makefile .
		 $ make DESIGN=<design>
		
# Useful docker-compose commands

You must be in the directory where the service configuration file
(usually docker-compose.yml) resides.  If the directory name does not
match, then the services can only be found by using the -p <project>
where project is the original directory name or project name used to
bring up the services.

- docker-compose up -d:  bring up all services (build images if needed)
  
- docker-compose down:  shut down all services and remove containers
  - --rmi all: remove images too
  
- docker-compose up -d <service>:  bring up a specific service.  This will set any environment variables and bind volumes at the time of bring-up (even if already up).
  
- docker-compose up -d --build <service>:  build and bring up a service
  
- docker-compose exec <service> <command>:  execute a command on a running container

Note that services that are 'up' are live and have live filesystems.
Edits there will impact the overall flow, so you can check changes by
modifying files in the relevant containers.  You can git push from
those containers as well.