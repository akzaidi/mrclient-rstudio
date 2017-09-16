# Docker Image for Microsoft R Client with RStudio Server

[Microsoft R Client](https://msdn.microsoft.com/en-us/microsoft-r/r-client) is an enhanced distribution of R that includes scalable machine learning and data processing packages. This Docker image installs the latest version of R Client on a Ubuntu 16.04 container. In addition to a complete distribution of R Client, this Docker image contains pre-trained models for image and text featurization, as well as a community version of RStudio Server. 


## How to Use This Docker Image

The best way to use this Docker image is to pull and build or run the image directly from Docker Hub. 

```bash
docker pull akzaidi/mrclient-rstudio
```

You can run the docker client and forward port 8787 for RStudio to your localhost:

```bash
docker run -d -p 8787:8787 akzaidi/mrclient-rstudio
```

Then navigate to `localhost:8787` in your browser and login to the RStudio Server instance using the username `rstudio` and password `rstudio`.

## Example Usage of `MicrosoftML`

One of the main packages of `R Client` is a scalable machine learning package called `MicrosoftML`. I have created a short course describing how to use the `MicrosoftML` package for common machine learning applications. For your convenience, the repository [github.com/Azure/learnAnalytics-MicrosoftML](https://github.com/Azure/learnAnalytics-MicrosoftML) is already cloned into the default home directory. Feel free to open up the `.Rmd` files and run the examples directly in RStudio Server.

The repoistory's tutorials are available in a book you can find here: [azure.github.io/learnAnalytics-MicrosoftML/](https://azure.github.io/learnAnalytics-MicrosoftML/).

## Licensing

Microsoft R Client has special licensing terms, which you agree to if you use this Docker image. The licensing information for MRO and MKL can be found online at [MRO and MKL licenses](https://mran.microsoft.com/faq/#licensing). 

## Feedback

If you find this repository useful or have any issues, feel free to reach out to me by [submitting an issue](https://github.com/akzaidi/mrclient-rstudio/issues).