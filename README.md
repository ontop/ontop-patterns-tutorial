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

9) Click on the `File` Menu, then `Preferences` and then to the `JDBC Drivers` tab to add the downloaded jdbc driver to Protégé:

![Image](img/jdbc-protege.png)

10) Click on the `File` Menu, then `Open` to open the Bgee ontology (`bgee_v14_genex.owl` file).

![Image1](img/open-onto-protege.png)

11) Check whether the connection to the database is working property, by clicking the `Test Connection` button under the `Datasource Manager` sub-tab of the `Ontop Mappings` tab.

12) ![Image2](img/check-connection-protege.png)

13) Click on the `Reasoner` Menu, then select `Ontop 4.1.0`

14) Click again on the `Reasoner` Menu, and on `Start Reasoner` to start Ontop

15) At this point, you are ready to try Ontop to answer the Bgee queries. To do so, use the `Ontop SPARQL` tab.

![Image4](img/sparql-protege.png)

### How Ontop Answers your Queries

Ontop operates in _virtual mode_, that is, the KG extracted from the mappings is not materialized. The SPARQL queries are translated on-the-fly into corresponding SQL queries executable over the original data source, by exploiting the mapping definitions and the ontology axioms. To see what is the SQL translation corresponding to your SPARQL query, you can right-click on the `SPARQL query editor` field and select the `View SQL translation` option:

![Image5](img/sql-translation.png)

### Use Another Query Answering Engine 

If you do not want to use Ontop for SPARQL query answering, you have the option to materialize the KG and import it into your favorite triple. To do this, click on the `Ontop` Menu and then `Materialize triples...` option.

![Image6](img/materialize-protege.png)
