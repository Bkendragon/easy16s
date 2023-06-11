Development of an R-shiny application to quickly and easily analyze 16S data.

Online server (beta test) : http://genome.jouy.inra.fr/shiny/easy16S/

# Shiny server Installation

Easy16S application actually  works on a Open Source Shiny Server.
For shiny server installation, we follow the [Rstudio Guide](http://docs.rstudio.com/shiny-server/).

1. Install and update R, the shiny R package and all the necessary packages

```bash
sudo yum install R
sudo su - -c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('rmarkdown')\""
```
2. [Download Shiny Server](https://www.rstudio.com/products/shiny/download-server/)

```bash
wget https://download3.rstudio.org/centos6.3/x86_64/shiny-server-1.5.9.923-x86_64.rpm
```
3. Install it with `gdebi` or `yum` according to your OS

```bash
sudo yum install --nogpgcheck shiny-server-1.5.9.923-x86_64.rpm
```

If necessary, you can stoping or starting the shiny server
```bash
sudo systemctl start shiny-server
sudo systemctl stop shiny-server
```
4. Configure shiny server

For example, this  is our `/etc/shiny-server/shiny-server.conf` :
```bash
# Instruct Shiny Server to run applications as the user "shiny"
run_as shiny;

# Define a server that listens on port 3838
server {
	listen 3838;

	# Define a location at the base URL
	location / {

		# Host the directory of Shiny Apps stored in this directory
		site_dir /srv/shiny-server;

		# Log all Shiny output to files in this directory
		log_dir /var/log/shiny-server;

		# When a user visits the base URL rather than a particular application,
		# an index of the applications available in this directory will be shown.
		directory_index on;
	}
}
```
5. Deploy application with a `git clone` in `/srv/shiny-server/`

```bash
cd /srv/shiny-server/
git clone https://gitlab.irstea.fr/cedric.midoux/easy16S.git
```
