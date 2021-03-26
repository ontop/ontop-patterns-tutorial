# patterns-tutorial
patterns-tutorial

Data: CC 0
Text: CC 4.0-BY

## Content

~~~
.
├── data
│   ├── mysql.zip
│   └── postgresql.zip
├── LICENSE
├── obda
│   ├── bgee_v14_genex.obda
│   ├── bgee_v14_genex.owl
│   ├── bgee_v14_genex.properties
│   ├── bgee_v14_genex.q
│   └── bgee_v14_genex.ttl
└── README.md
~~~

- `data`: MySQL and postgres dumps
- `bgee_v14_genex.obda`: Mapping file (Ontop syntax)
- `bgee_v14_genex.ttl`: Mapping file (R2RML syntax)
- `bgee_v14_genex.owl`: Ontology file
- `bgee_v14_genex.properties`: Properties file
- `bgee_v14_genex.q`: Queries file

## Protégé+postgres Tutorial

In this tutorial we will use the postgres dump and the graphical tool Protégé. 

1) Create a database called `easybgee_v14_2`. For example, in `pgsql` you can use the command:

~~~
pgsql> CREATE DATABASE easybgee_v14_2;
~~~

2) Unzip the postgres archive to extract the dump file.

3) Use the extracted dump file to create a database `easybgee_v14_2`. For example, you can use the following bash `pgsql` invocation:

~~~
$> PGPASSWORD=$pwd psql -h $host -p $port --user=$user --dbname=$db_name -f $dump_file
~~~

5) Provide the connection parameters to your database in the `bgee_v14_genex.properties` file.

~~~
jdbc.url=jdbc\:postgresql\://host\:port/easybgee_v14_2
jdbc.driver=org.postgresql.Driver
jdbc.user=
jdbc.password=
~~~

6) Download the latest version of Ontop+Protégé [bundle](https://sourceforge.net/projects/ontop4obda/files/). Choose a bundle suitable to your operating system.

7) Unzip the bundle, and download the postgres [jdbc driver](https://jdbc.postgresql.org/) to allow the connection between Protégé and your database. 

8) Launch Protégé through the dedicated script. In case of linux, the command is

~~~
$> ./run.sh
~~~

9) Click on the Menu File, then Preferences and then to the JDBC Drivers tab to add the jdbc downloaded driver to Protégé:

![Image](img/jdbc-protege.png)
