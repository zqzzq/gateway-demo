## Introduction

This guide provides instructions for developers to compile and build healthmall-gateway-demo project. 


## Step 1: Prepare for a build environment for healthmall-gateway-demo

The build environment requires Docker, Docker Compose development environment. Please install the below prerequisites:

Software              | Required Version
----------------------|--------------------------
docker-ce             | 17.03 +
docker-compose        | 1.14.0 +
make                  | 3.81 +


## Step 2: Getting the source code

   ```sh
      $ git clone http://10.110.18.40:10080/inspursoft/healthmall-gateway-demo.git
   ```


## Step 3: Compiling project and Building images

### I. Compile project 

   ```sh
      $ cd healthmall-gateway-demo
      $ make compile
   ```

### Ⅱ. Building images  

   ```sh
      $ make build
   ```
**Note**: Then you can get five images, such as healthmall_db, healthmall_apiserver, healthmall_tokenserver, healthmall_proxy and healthmall_istiogateway.   

## Appendix
* Using the Makefile

The `Makefile` contains predefined targets:

Target                           | Description
---------------------------------|-------------
all                              | Compile healthmall-gateway-demo binary, ui and Build images
compile                          | Compile healthmall-gateway-demo binary and ui
build                            | Build healthmall-gateway-demo images
fmt                              | Formats healthmall-gateway-demo source files
vet                              | Examines healthmall-gateway-demo source code and reports suspicious constructs 
golint                           | Linter for source code
clean                            | Print help infomation about clean
cleanall                         | Clean binary and images 
cleanbinary                      | Clean binary 
cleanimage                       | Clean images
$IMG_build                       | Build $IMG image 
$IMG_rmi                         | Clean $IMG image
src/$PACKAGE_clean               | Clean $PACKAGE binary
src/$PACKAGE_fmt                 | Formats $PACKAGE source files
src/$PACKAGE_install             | Compile $PACKAGE binary
src/$PACKAGE_vet                 | Examines $PACKAGE source code and reports suspicious constructs
src/$PACKAGE_compile             | Check $PACKAGE source file by fmt vet golint and compile
src/$PACKAGE_golint              | Linter for $PACKAGE source code


   **Note**: IMG's value is one of apiserver, tokenserver, proxy, db and istiogateway. PACKAGE's value is one of apiserver, tokenserver and istiogateway. 


#### EXAMPLE:


#### Compile project

   ```sh
      $ make compile
   ```
   
#### Build apiserver image

   ```sh
      $ make apiserver_build 
   ```

#### Clean apiserver image

   ```sh
      $ make apiserver_rmi 
   ```

#### Formats apiserver source files

   ```sh
      $ make src/apiserver_fmt 
   ```

#### Examines apiserver source code and reports suspicious constructs

   ```sh
      $ make src/apiserver_vet 
   ```

#### Linter for apiserver source code

   ```sh
      $ make src/apiserver_golint
   ```

#### Compile apiserver binary

   ```sh
      $ make src/apiserver_install
   ```

#### Check apiserver source file by fmt vet golint and compile

   ```sh
      $ make src/apiserver_compile 
   ```

#### Clean apiserver binary

   ```sh
      $ make src/apiserver_clean
   ```
