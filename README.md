# chefspec-render-file

This cookbook demonstrates an issue with chefspec's render_file matcher.

The default recipe either lays down a template or deletes it depending on the value of a node attribute. The chefspec tests assert that the template is created when the node attribute is set, and that the file is deleted when the node attribute is unset. However, using `render_file` does not correctly match in the attribute-set case.

## Usage

```
$ bundle
$ bundle exec rake chefspec
```
