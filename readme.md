# Name Parser
---

This R package, `name.parser`, uses U.S. Census data to parse full names of individuals by identifying surnames, stripping salutations and suffixes, and processing common naming conventions.  Additionally, the names are evaluated for gender and the confidence level of that determination.

## Motivation

It is a common occurrence to receive data with respect to individuals names in a single string, or single attribute.  Stripping this name into a 'first' name, 'middle' name, 'last' name, etc, is essential for comparison and other analytic endeavors.  Since, a simple algorithm, i.e. left most 'word' is the 'first' name, does not always work, even within the same data set, this algorithm was built to 'pull' apart a persons name into a 'best guess' set of strings.  Additionally, non-alpha characters, duplicate spacing, control characters, etc, are required to be removed in the processing of the string.

## Prerequisites

The two required packages, `data.table` and `parallel` - both of which are installing when this library is loaded.  The census data utilizes the `data.table` library for look-ups and aggregation, while the `parallel` library is used when multiple names are required to process.

## Installation

Using the `devtools` function, install with the below:

```r
install_github('mjfii/Name-Parser')
library('name.parser')
```

## Examples

To parse a name:

```r
# returns a single pipe (`|`) delimted string, e.g. "salutation|first|middle|last|suffix|gender|confidence".
x <- 'livingston III,  Mr. MICHAEL JOHN9'
parse.name(x)
# or, for multiple names in a `data.table` with similar attributes
parse.names(x)
```

To 'prepare' a name:
```r
x <- 'livingston III,  Mr. MICHAEL JOHN9'
prep.name(x)  
```

To get the census data:
```r
x <- 'livingston III,  Mr. MICHAEL JOHN9'
x <- prep.name(x)
x <- strsplit(x,' ')[[1]]
get.census.data(x)
```

To determine surname (last name) ordinal:
```r
x <- 'livingston III,  Mr. MICHAEL JOHN9'
x <- prep.name(x)
x <- strsplit(x,' ')[[1]]
cd <- get.census.data(x)
print(x)
determine.surname(cd)
```

To determine gender:
```r
x <- 'livingston III,  Mr. MICHAEL JOHN9'
x <- prep.name(x)
x <- strsplit(x,' ')[[1]]
cd <- get.census.data(x)
determine.gender(cd)
```

## Contributors

Michael Flanigan  
 email: [mick.flanigan@gmail.com](mick.flanigan@gmail.com)  
 twitter: [@mjfii](https://twitter.com/mjfii)  

# Versioning

0.0.0.9000 - Initial deployment (2017-02-10)