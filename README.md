# Archived 

## Jupiterbroadcasting Api

An API that interfaces with Jupiterbroadcasting's RSS feeds and converts them into JSON for easy consumption.
It can be reached at `` `https://www.jupitercolony.rocks/api/jupiterbroadcasting/[showname]` ``

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing

First clone this repository

``` bash
git clone https://github.com/rangeroob/jupiterbroadcasting-api.git
```

Next change current directory

``` bash
cd jupiterbroadcastin-api
```

Then install all dependencies

``` ruby
bundle install
```

After that run rackup

``` ruby
rackup
```

Lastly go to localhost:9292 ex:

``` bash
curl localhost:9292/api/jupiterbroadcasting/coderradio
```

Will give you json output of the coder radio rss feed

## Running the tests

``` ruby
rake test
```

## Built With

[Cuba](https://github.com/soveran/cuba)

[Active Support](https://github.com/rails/rails/tree/master/activesupport)

[Rack-Cors](https://github.com/cyu/rack-cors)

## Tested With

 [Rack-Test](https://github.com/rack-test/rack-test)

 [Cutest](https://github.com/djanowski/cutest)

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/rangeroob/jupiterbroadcasting-api/tags).

## Authors

**Derek Viera** - *Initial work* - [rangeroob](https://github.com/rangeroob)

See also the list of [contributors](https://github.com/rangeroob/jupiterbroadcasting-api/contributors) who participated in this project.

## License

This project is licensed under the ISC License - see the [LICENSE](LICENSE) file for details
