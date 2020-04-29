
module PartB_question3 where
import PartB_question2

perms::[ Int ] -> [[ Int ]]
perms []=[[]]
perms xs=[a:j |a <-xs,j<-perms(delete a xs)]
