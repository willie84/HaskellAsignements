
--Part A :Explanation of the algorithm
-- Part B: Coding

--First is to describe the algorithm used to build the Turing machine to check palindrome

-- A turing machine has seven elements(states, start state, Alphabet, tapeIndex,Transitions,
--blank symbol and accept states)

-- To create a palindrome program, we need to follow the following algorithm,
-- step 1, read the first letter of the string. Let say may be 'a' and replace with a blank
-- step 2, move the tape Ri until you find the blank symbol (meaning it is the end of
-- the string) and move Le one step to get the final symbol. If this match with first symbol,
-- then put a blank symbol on the symbol and move to the Ri until blank to continue with
-- the process. If the symbol is not the same, halt the process as it no longer a palindrome.
-- step 3, repeat the above process till the whole string is blank and it becomes a palindrome.
-- if not palindrome, the process halts in between.

-- for example string  abba, you put it in a Turing machine it becomes abba_(blank showing end)
-- step 1; replace 'a' with blank symbol and move till Ri, _bba_, when you meet 'a' at end
-- replace with blank, _bb__, move Ri and process continue. repeat the process and at end is ____(palindrome)

--picture of turing machine is at palindrome.jpg file.

--CODE IN HASKELL
module PartC where
import Data.Sequence
import Data.Foldable
import Debug.Trace
import qualified Data.List as Jam
import Data.Char

-- Main Functions
-- Initializes a tape from a string
string_To_Tape :: String -> Seq Char
string_To_Tape string = fromList ("_" ++ string ++ "_")


-- Executes the main function. Check the length of string first to be max of 4
palindromeTM :: String -> String
palindromeTM string | k <=4    = executeTm (Tmachine {pos=1, state=Q0, tape=string_To_Tape string})
              | otherwise            = show ("Kindly input a string of size 4 or less")
              where k = Jam.length string
--palindromeTM string = executeTm (Tmachine {pos=1, state=Q0, tape=string_To_Tape string})


-- Step 1: Define a datatype that encompasses of the states
data State = Q0 | Q1 | Q2 | Q3 | Q4 | Q5 | Accept_State | Reject_State
    deriving (Eq, Show)

-- Step 2: Define a datatype for the TuringMachine (Head position, Current State, Tape)

data Tmachine = Tmachine {pos :: Int, state :: State, tape :: Seq Char}


--Step 3: To display the turing machine we need to implement the show method

instance Show Tmachine where
    show (Tmachine temp_posit temp_state current_tape) =
        "Tape: " ++ (show (toList current_tape)) ++ ", Current Position: " ++ (show temp_posit) ++ ", Current State: " ++ (show temp_state)

-- Step 4: Describe the motion of the tape. This need a data type called Action

data Action = Le | Ri


-- Step 5 : A hybrid function called move to deduce the index of the tape.
move :: Action -> Int -> Int
move Le index = index - 1;
move Ri index =index + 1

-- Step 6 is to describe the Transitions

--The transition function of the turing Machine

-- A transition takes a Turing machine and a state and character and returns
--a new state

transition :: Tmachine -> State -> Char -> Tmachine

-- Accept_State/Reject_State Transitions

-- Assign the accept state to accept state transition
transition tm Accept_State _ = Tmachine {
    pos=pos tm, state=Accept_State, tape=tape tm}

--Assign the reject state to accept state transition
transition tm Reject_State _ = Tmachine {
    pos=pos tm, state=Reject_State, tape=tape tm}

--From the diagram shown  the following  transitions are shown
transition tm Q0 'a' = Tmachine {
    -- (Q0, a) -> (Q1, _, Ri)
    pos=move Ri (pos tm), state=Q1, tape=update (pos tm) '_' (tape tm)}
transition tm Q1 'a' = Tmachine {
    -- (Q1, a) -> (Q1, a, Ri)
    pos=move Ri (pos tm), state=Q1, tape=tape tm}
transition tm Q1 'b' = Tmachine {
    -- (Q1, b) -> (Q1, b, Ri)
    pos=move Ri (pos tm), state=Q1, tape=tape tm}
transition tm Q1 '_' = Tmachine {
    -- (Q1, _) -> (Q2, _, Le)
    pos=move Le (pos tm), state=Q2, tape=tape tm}
transition tm Q2 'a' = Tmachine {
    -- (Q2, a) -> (Q3, _, Le)
    pos=move Le (pos tm), state=Q3, tape=update (pos tm) '_' (tape tm)}
transition tm Q2 'b' = Tmachine {
    -- (Q2, b) -> (Reject_State, b, N)
    pos=pos tm, state=Reject_State, tape=tape tm}
transition tm Q2 '_' = Tmachine {
    -- (Q2, _) -> (Accept_State, _, N)
    pos=pos tm, state=Accept_State, tape=tape tm}


-- Replace the character with blank
-- if a move to Rejcet_state, if "_" accept, else move to Q3

transition tm Q0 'b' = Tmachine {
    -- (Q0, b) -> (Q4, _, Ri)
    pos=move Ri (pos tm), state=Q4, tape=update (pos tm) '_' (tape tm)}
transition tm Q4 'a' = Tmachine {
    -- (Q4, a) -> (Q4, a, Ri)
    pos=move Ri (pos tm), state=Q4, tape=tape tm}
transition tm Q4 'b' = Tmachine {
    -- (Q4, b) -> (Q4, b, Ri)
    pos=move Ri (pos tm), state=Q4, tape=tape tm}
transition tm Q4 '_' = Tmachine {
    -- (Q4, _) -> (Q5, _, Le)
    pos=move Le (pos tm), state=Q5, tape=tape tm}
transition tm Q5 'a' = Tmachine {
    -- (Q5, a) -> (Reject_State, a, N)
    pos=pos tm, state=Reject_State, tape=tape tm}
transition tm Q5 'b' = Tmachine {
    -- (Q5, b) -> (Q3, _, Le)
    pos=move Le (pos tm), state=Q3, tape=update (pos tm) '_' (tape tm)}
transition tm Q5 '_' = Tmachine {
    -- (Q5, _) -> (Accept_State, _, N)
    pos=pos tm, state=Accept_State, tape=tape tm}


-- Q3 transitions
-- either (a,b)

transition tm Q3 'a' = Tmachine {
    -- (Q3, a) -> (Q3, a, Le)
    pos=move Le (pos tm), state=Q3, tape=tape tm}
transition tm Q3 'b' = Tmachine {
    -- (Q3, b) -> (Q3, b, Le)
    pos=move Le (pos tm), state=Q3, tape=tape tm}
transition tm Q3 '_' = Tmachine {
    -- (Q3, _) -> (Q0, _, Ri)
    pos=move Ri (pos tm), state=Q0, tape=tape tm}


--Blank symbol transitions
transition tm Q0 '_' = Tmachine {
    -- (Q0, _) -> (Accept_State, _, N)
    pos=pos tm, state=Accept_State, tape=tape tm}



--Finally execute the Turing Machine

executeTm :: Tmachine -> String
executeTm tm    | (state tm) == Accept_State = trace (show tm) "OUTPUT: a"
            | (state tm) == Reject_State = trace (show tm) "OUTPUT: b"
            | otherwise       = trace (show tm)
                executeTm (transition tm (state tm) (index (tape tm) (pos tm)))
