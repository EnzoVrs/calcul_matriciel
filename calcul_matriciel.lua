-- Fonction Calculer



function additionner(a, b)
     return a + b
end


function soustraire(a,b)
   return a - b
end

--------------------------------------------------------------
-- Fonction MAin 


function main()

Printf("Je suis dans la fonction main")
Echo("Je suis dans la fonction main")

 local result = soustraire(10,5)
 local result2 = additionner(120,34)
 Printf(result2)
 ErrPrintf(result)
 ErrPrintf("Attention Enzo tu va merge un preset")
 --local result3 = diviser(10,20,30)
 Printf(HostOS())
 Printf(message) 
 --ErrPrintf(result3)

end 

return main


------------------------------------------------------------------------


--function diviser(a,b,c)

--return a / b /c
--end