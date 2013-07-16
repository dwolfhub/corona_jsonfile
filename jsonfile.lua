-- Development by Daniel Wolf
-- For Oncall Interactive


--- JsonFile Library
local JsonFile = {}

-- requires
local io = require 'io'
local json = require 'json'

--- read data from a json file
--@param string fileName file to be read
--@return table 

function JsonFile:readFileData(fileName)

    -- get file path
    local filePath = system.pathForFile(fileName, system.DocumentsDirectory)

    -- open data file
    local dataFile = io.open(filePath, 'r')

    -- get file data
    local dataString = dataFile:read('*a')

    -- close file
    io.close(dataFile)

    -- decode json from file
    local jsonData = json.decode(dataString)

    return jsonData

end


--- write json data to a file
--@param string fileName file to be written to
--@param table data the data to be encoded and written to json file
--@return void 

function JsonFile:writeFileData(fileName, data)
    
    -- get file path
    local filePath = system.pathForFile(fileName, system.DocumentsDirectory)

    -- open data file
    local dataFile, error = io.open(filePath, 'w')
    
    if error == nil then
        -- write json to file
        dataFile:write(json.encode(data))

        -- close file
        io.close(dataFile)
        dataFile, filePath = nil        
    end

end


--- append json data to a file
--@param string fileName file to be appended to
--@param table data the data to be encoded and appended to json file
--@return void

function JsonFile:appendFileData(fileName, data)

    -- get file path
    local filePath = system.pathForFile(fileName, system.DocumentsDirectory)

    -- open data file in read mode
    local dataFile, error = io.open(filePath, 'r')

    if error == nil then
        -- get file data
        local dataString = dataFile:read('*a')

        -- close file
        io.close(dataFile)

        -- json decode file data
        local jsonData = json.decode(dataString)
        
        -- add new data 
        table.insert(jsonData, data)

        -- open file in write mode
        local dataFile, error = io.open(filePath, 'w')

        -- write json to file
        dataFile:write(json.encode(jsonData))

        -- close file
        io.close(dataFile)
        
    end

end

return JsonFile