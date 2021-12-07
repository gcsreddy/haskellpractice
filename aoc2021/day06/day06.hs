
>> map (\x -> (head x, length x)) . group . sort $ x
[(1,121),(2,47),(3,38),(4,44),(5,50)]
>> func6 (t0:t1:t2:t3:t4:t5:t6:t7:t8:[]) =  t1:t2:t3:t4:t5:t6:(t7+t0):t8:t0:[]
>> sum  $ iterate' func6 [0,121,47,38,44,50,0,0,0] !! 256
163964*******[masked]
>>


