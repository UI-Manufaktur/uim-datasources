[![Total Downloads](https://img.shields.io/packagist/dt/cakephp/datasource.svg?style=flat-square)](https://packagist.org/packages/cakephp/datasource)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE.txt)

# UIM Datasource Library

This library contains interfaces for implementing Repositories and Entities using any data source,
a class for managing connections to datasources and traits to help you quickly implement the
interfaces provided by this package.

## Repositories

A repository is a class capable of interfacing with a data source using operations such as
`find`, `save` and  `delete` by using intermediate query objects for expressing commands to
the data store and returning Entities as the single result unit of such system.

In the case of a Relational database, a Repository would be a `Table`, which can be return single
or multiple `Entity` objects by using a `Query`.

This library exposes the following interfaces for creating a system that : the
repository pattern and is compatible with the UIM framework:

* `IRepository` - Describes the methods for a base repository class.
* `IEntity` - Describes the methods for a single result object.
* `IResultSet` - Represents the idea of a collection of Entities as a result of a query.

Additionally, this package provides a few traits and classes you can use in your own implementations:

* `EntityTrait` - Contains the default implementation for the `IEntity`.
* `QueryTrait` - Exposes the methods for creating a query object capable of returning decoratable collections.
* `ResultSetDecorator` - Decorates any traversable object, so it complies with `IResultSet`.


## Connections

This library contains a couple of utility classes meant to create and manage
connection objects. Connections are typically used in repositories for
interfacing with the actual data source system.

The `ConnectionManager` class acts as a registry to access database connections
your application has. It provides a place that other objects can get references
to existing connections. Creating connections with the `ConnectionManager` is
easy:

```php
import uim.datasources.ConnectionManager;

ConnectionManager::config("connection-one", [
    "className": "MyApp\Connections\CustomConnection",
    "param1": "value",
    "param2": "another value"
]);

ConnectionManager::config("connection-two", [
    "className": "MyApp\Connections\CustomConnection",
    "param1": "different value",
    "param2": "another value"
]);
```

When requested, the `ConnectionManager` will instantiate
`MyApp\Connections\CustomConnection` by passing `param1` and `param2` inside an
array as the first argument of the constructor.

Once configured connections can be fetched using `ConnectionManager::get()`.
This method will construct and load a connection if it has not been built
before, or return the existing known connection:

```php
import uim.datasources.ConnectionManager;
$conn = ConnectionManager::get("master");
```

It is also possible to store connection objects by passing the instance directly to the manager:

```php
import uim.datasources.ConnectionManager;
$conn = ConnectionManager::config("other", $connectionInstance);
```

## Documentation

Please make sure you check the [official API documentation](https://api.cakephp.org/4.x/namespace-Cake.Datasource.html)
