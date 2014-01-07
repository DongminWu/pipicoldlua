local Object = require 'Oop/Object'

local SomeClass = Object:subclass(...)

function SomeClass:itWorks()
    return true
end

return SomeClass
