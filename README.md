# JSON File Manipulation Library

#### Note:

This library assumes you will be using the system.DocumentsDirectory to store your files, as is the standard convention.

## JsonFile:readFileData(fileName)

#### Parameters
> - fileName (string) name of the file to be read

#### Return
> table of the json decoded data from the json file requested

#### Example
```lua
local jsonFile = require "library.data.jsonfile"
local jsonData = jsonFile:readFileData("myjsonfile.json")
print(jsonData)
```

## JsonFile:writeFileData(fileName, data)

#### Parameters
> - fileName (string) name of the file to be written to
> - data (table) the data to be encoded and written to the json file

#### Return
> void

#### Example
```lua
local jsonFile = require "library.data.jsonfile"
local data = {index1="hello world"}
jsonFile:writeFileData("myjsonfile.json", data)
```
## JsonFile:appendFileData(fileName, data)

#### Parameters
> - fileName (string) name of the file to be written to
> - data (table) the data to be encoded and written to the end of the json data

#### Return
> void

#### Example
```lua
    local jsonFile = require "library.data.jsonfile"
    local data = {index1="hello world"}
    jsonFile:appendFileData("myjsonfile.json", data)
```
