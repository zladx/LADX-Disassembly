Dialog000:: ; Tarin
    db "Whoa, boy! Where"
    db "ya off to in    "
    db "such a hurry?   "
    db "Set a spell, I  "
    db "got somethin' ta"
    db "tell ya!@"

Dialog001:: ; Marin
    db "What a relief! I"
    db "thought you'd   "
    db "never wake up!  "
    db "You were tossing"
    db "and turning...  "
    db "What?  Zelda?   "
    db "No, my name's   "
    db "Marin!  You must"
    db "still be feeling"
    db "a little woozy. "
    db "You are on      "
    db "Koholint Island!@"

Dialog002:: ; Marin
    db "Follow the lane "
    db "south to reach  "
    db "the beach where "
    db "I found you.    "
    db "Since you washed"
    db "ashore, lots of "
    db "nasty monsters  "
    db "have been in the"
    db "area, so be     "
    db "careful, okay?@"

Dialog003:: ; Marin
    db "Hi!  Tarin went "
    db "to the forest to"
    db "look for toad-  "
    db "stools, but I'd "
    db "rather sing.    "
    db "Listen to this, "
    db "it's called the "
    db "'Ballad of the  "
    db "Wind Fish.'@"

Dialog004:: ; Marin
    db "Hey!  That's a  "
    db "nice Ocarina you"
    db "have there! Will"
    db "you accompany   "
    db "me as I sing?@"

Dialog005:: ; Marin
    db "I just love to  "
    db "sing-- what can "
    db "I say?  What do "
    db "you like to do, "
    db "#####?@"

Dialog006:: ; Marin
    db "#####, Tarin's  "
    db "taking a nap at "
    db "home.  I don't  "
    db "know how he can "
    db "sleep on such a "
    db "nice day!  It   "
    db "makes me want to"
    db "sing a song...  "
    db "Yes, the song is"
    db "'Ballad of the  "
    db "Wind Fish!'@"

Dialog007:: ; Narrator
    db "Eh? It's locked!"
    db "You can open the"
    db "door with the   "
    db "Nightmare Key.@"

Dialog008:: ; Narrator
    db "You got a Piece "
    db "of Power!  You  "
    db "can feel the    "
    db "energy flowing  "
    db "through you!@"

Dialog009:: ; Witch
    db "Ahhh... It has  "
    db "the Sleepy Toad-"
    db "stool, it does! "
    db "We'll mix it up "
    db "something in a  "
    db "jiffy, we will!@"

Dialog00A:: ; Tarin
    db "The last thing I"
    db "kin remember was"
    db "bitin' into a   "
    db "big juicy toad- "
    db "stool... Then, I"
    db "had the darndest"
    db "dream... I was a"
    db "raccoon!  Yeah, "
    db "sounds strange, "
    db "but it sure was "
    db "fun!@"

Dialog00B:: ; Tarin
    db "I'm all tucker'd"
    db "out...  I think "
    db "I better set a  "
    db "spell before I  "
    db "head home...@"

Dialog00C:: ; Witch
    db "Double double,  "
    db "toil and trouble"
    db "a toadstool mix "
    db "makes powder for"
    db "tricks!@"

Dialog00D:: ; Tarin
    db "As a raccoon, my"
    db "nose is verrry  "
    db "sensitive, ta   "
    db "stuff like dust "
    db "and powder...@"

Dialog00E:: ; Narrator
    db "It's the toad-  "
    db "stool you picked"
    db "in the woods.   "
    db "What is it for? "
    db "You hold it over"
    db "your head and a "
    db "mellow aroma    "
    db "wafts into your "
    db "nostrils.@"

Dialog00F:: ; Narrator
    db "You pick the    "
    db "toadstool... As "
    db "you hold it over"
    db "your head, a    "
    db "mellow aroma    "
    db "flows into your "
    db "nostrils.@"

Dialog010:: ; Tarin
    db "Hrrrm...Snore..."
    db "Hunh?... If'n ya"
    db "don' know...call"
    db "old man Ulrira! "
    db "Zonk...Snore...@"

Dialog011:: ; Tarin
    db "I'm tired... I'm"
    db "goin' ta sleep  "
    db "now... Zzzzzz...@"

Dialog012:: ; Talking Tree
    db "Well that was a "
    db "surprise!  Hey! "
    db "I'll tell you a "
    db "secret! Use your"
    db "sword to poke at"
    db "dungeon walls..."
    db "If you hear a   "
    db "hollow clank,   "
    db "you can break   "
    db "the wall with a "
    db "Bomb!@"

Dialog013:: ; Narrator
    db "You've learned  "
    db "the 'Ballad of  "
    db "the Wind Fish!' "
    db "This song will  "
    db "always remain in"
    db "your heart!@"

Dialog014:: ; Marin
    db "Please remember "
    db "this song!  You "
    db "should play it  "
    db "every once in a "
    db "while to keep it"
    db "fresh in your   "
    db "mind!@"

Dialog015:: ; Marin
    db "Please!  I want "
    db "you to learn it!"
    db "This song is my "
    db "favorite!@"

Dialog016:: ; Marin
    db "So, how do you  "
    db "like it?  It's  "
    db "really touching,"
    db "isn't it?  Does "
    db "it stick in your"
    db "mind?           "
    db "    Yes  No<ask>"

Dialog017:: ; Crazy Tracy
    db "Hi there, big   "
    db "guy!  I'm Crazy "
    db "Tracy!  I've got"
    db "a little secret "
    db "for sale that'll"
    db "pump you up!@"

Dialog018:: ; Crazy Tracy
    db "Will you give me"
    db "28 Rupees for my"
    db "secret?         "
    db "    Give Don't<ask>"

Dialog019:: ; Crazy Tracy
    db "How about it?   "
    db "42 Rupees for my"
    db "little secret..."
    db "    Give Don't<ask>"

Dialog01A:: ; Crazy Tracy
    db "All right, come "
    db "here and I'll   "
    db "rub it on you!  "
    db "...There... I've"
    db "applied my own  "
    db "secret medicine!"
    db "It will take    "
    db "effect when you "
IF VERSION >= 2
    db "lose all hearts!"
ELSE
    db "lose all heart! "
ENDC
    db "Drop by again,  "
    db "big guy!@"

Dialog01B:: ; Crazy Tracy
    db "Beat it, then!  "
    db "Come back when  "
    db "you have some   "
    db "cash!@"

Dialog01C:: ; Crazy Tracy
    db "... ... ... ... "
    db "But I won't sell"
    db "it to you!@"

Dialog01D:: ; Crazy Tracy
    db "Well!  I'm only "
    db "offering you a  "
    db "secret that will"
    db "make you strong!"
    db "You're such a   "
    db "chicken!!@"

Dialog01E:: ; Crazy Tracy
    db "...You're so    "
    db "cute!  I'll give"
    db "you a 7 Rupee   "
    db "discount!@"

Dialog01F:: ; Narrator
    db "You got Marin!  "
    db "Is this your big"
    db "chance?@"

Dialog020:: ; Mutt
    db "GRRRR...@"

Dialog021:: ; Tarin
    db "Heh heh heh ho! "
    db "You're goin' ta "
    db "be lost, thanks "
    db "to me!  Heh heh!@"

Dialog022:: ; BowWow
    db "BOW WOW!        "
    db "BOW WOW!@"

Dialog023:: ; ChowChow
    db "YIP YIP!        "
    db "YIP YIP!@"

Dialog024:: ; Great Fairy
    db "Let's heal your "
    db "wounds and get  "
    db "rid of all that "
    db "stress... Close "
    db "your eyes and   "
    db "relax...@"

Dialog025:: ; Grim Creeper (D7 Mini-Boss)
    db "You dirty rat!  "
    db "You k-k-k...beat"
    db "my brothers!    "
    db "You'll pay!!    "
    db "I'll never      "
    db "forget you!@"

Dialog026:: ; Grim Creeper (D7 Mini-Boss)
    db "Hey runt!  You  "
    db "think you can   "
    db "take me?!  All  "
    db "right boys, get "
    db "this punk out   "
    db "of my face!@"

Dialog027:: ; Papahl
    db "Yep!  Those're  "
    db "my boys!  I'm   "
    db "Papahl, pleased "
    db "ta meetcha! I'll"
    db "be lost in the  "
    db "hills later, so "
    db "keep a look out "
    db "for me, hear?@"

Dialog028:: ; Marin
    db "Yes!!  Yes!!    "
    db "Break them!     "
    db "Break them all! "
    db "... ... ... ... "
    db "What?  What's   "
    db "wrong?@"

Dialog029:: ; Shopkeeper
    db "Aye Caramba!    "
    db "Kid, you have a "
    db "lot to learn,   "
    db "trying to buy   "
    db "something you   "
    db "have no use for!@"

Dialog02A:: ; Narrator
    db "You've got a    "
    db "Heart!  Thump!  "
    db "One of your     "
    db "Heart Containers"
    db "is filled!@"

Dialog02B:: ; Shopkeeper, Link
Dialog02C:: ; Shopkeeper, Link
    db "Bow & Arrow Set "
    db "Only 980 Rupees!"
    db "    Buy  No Way<ask>"

Dialog02D:: ; Shopkeeper, Link
    db "   10 Arrows    "
    db "   10 Rupees    "
    db "    Buy  Don't<ask>"

Dialog02E:: ; Shopkeeper
    db "Hey!  Welcome!  "
    db "See something   "
    db "you like?!  Just"
    db "bring it here!@"

Dialog02F:: ; Shopkeeper
    db "Hey! You! Stop! "
    db "You gotta pay!  "
    db "Put it back!@"

Dialog030:: ; Shopkeeper, Link
    db "  Deluxe Shovel "
    db "   200 Rupees!  "
    db "Seems expensive!"
    db "    Buy  No Way!"
    db "<ask>"

Dialog031:: ; Shopkeeper, Link
    db "   Three Hearts "
    db "    10 Rupees!  "
    db "    Buy  Don't<ask>"

Dialog032:: ; Shopkeeper, Link
    db "     Shield     "
    db "    20 Rupees!  "
    db "    Buy  Don't<ask>"

Dialog033:: ; Shopkeeper, Link
    db "    Ten Bombs   "
    db "    10 Rupees   "
    db "    Buy  Don't<ask>"

Dialog034:: ; Shopkeeper
    db "Sorry, kid!  You"
    db "don't have the  "
    db "Rupees!  Come   "
    db "back when you   "
    db "have the cash!@"

Dialog035:: ; Shopkeeper
    db "Thanks a lot!   "
    db "And come again!@"

Dialog036:: ; Narrator
    db "Guess what?  You"
    db "got it for free."
    db "Are you proud of"
    db "yourself?@"

Dialog037:: ; Shopkeeper
Dialog038:: ; Shopkeeper
    db "I wasn't kidding"
    db "when I said pay!"
    db "Now, you'll pay "
    db "the ultimate    "
    db "price!!@"

Dialog039:: ; Narrator
    db "Hunh?  It sounds"
    db "like the castle "
    db "gate opened! You"
    db "can easily leave"
    db "the castle now!@"

Dialog03A:: ; Trendy Gamester
Dialog03B:: ; Trendy Gamester
    db "  TRENDY GAME!  "
    db " One Play 10 Rs."
    db "    Play No<ask>"

Dialog03C:: ; Trendy Gamester
    db "The A and B     "
    db "Buttons move the"
    db "crane...The rest"
    db "is just timing! "
    db "Go over to the  "
    db "buttons to play!"
    db "Good Luck!@"

Dialog03D:: ; Narrator
    db "It's a Shield!  "
    db "There is space  "
    db "for your name!@"

Dialog03E:: ; Trendy Gamester, Link
    db "Challenge Again?"
    db "    Play No<ask>"

Dialog03F:: ; Trendy Gamester
    db "Good Luck!@"

Dialog040:: ; Trendy Gamester
    db "We're closing up"
    db "for today!  Come"
    db "again, anytime!@"

Dialog041:: ; Narrator
    db "You got some    "
    db "Magic Powder!   "
    db "Try to sprinkle "
    db "it on many      "
    db "things!@"

Dialog042:: ; Trendy Gamester, probably
    db "It's 30 Rupees! "
    db "You can play the"
    db "game three more "
    db "times with this!@"

Dialog043:: ; Ghost
    db "Cough Cough...  "
    db "Don't sprinkle  "
    db "that on me...   "
    db "...I'll have to "
    db "curse you!      "
    db "Cough Cough...@"

Dialog044:: ; Narrator
    db "You got a Yoshi "
    db "Doll!  Recently,"
    db "he seems to be  "
    db "showing up in   "
    db "many games!@"

Dialog045:: ; Fisherman
    db "How about some  "
    db "fishing, little "
    db "buddy? I'll only"
    db "charge you 10   "
    db "Rupees...       "
    db "    Fish Not Now"
    db "<ask>"

Dialog046:: ; Fisherman
    db "You have to have"
    db "more passion!   "
    db "Live a little!@"

Dialog047:: ; Fisherman
    db "Okay, here's how"
    db "you do it.  Use "
    db "<left> and <right> on the <dpad>"
    db "to aim a cast.  "
    db "Once you hook a "
    db "fish, press the "
    db "Button rapidly  "
    db "to reel him in!@"

Dialog048:: ; Fisherman, Link
    db "Why not try one "
    db "more time,      "
    db "little buddy?   "
    db "    Cast Not Now"
    db "<ask>"

Dialog049:: ; Fisherman, Link
    db "Wow! That one   "
    db "got away!  Want "
    db "to try again?   "
    db "    Cast Not Now"
    db "<ask>"

Dialog04A:: ; Fisherman, Link
    db "Wow! Nice Fish! "
    db "It's a lunker!! "
    db "I'll give you a "
    db "20 Rupee prize! "
    db "Try again?      "
    db "    Cast Not Now"
    db "<ask>"

Dialog04B:: ; Fisherman, Link
    db "This pond's all "
    db "fished out.  Why"
    db "not try your    "
    db "luck in the sea?"
    db "    Okay No<ask>"

Dialog04C:: ; Fisherman, Link
    db "Did I say that? "
    db "Forget it, okay?"
    db "Run along now...@"

Dialog04D:: ; Fisherman, Link
    db "It's a runt!    "
    db "I'll only give  "
    db "you a 5 Rupees  "
    db "prize for that. "
    db "You should try  "
    db "again!          "
    db "    Okay No<ask>"

Dialog04E:: ; Fisherman
    db "You're short of "
    db "Rupees?  Don't  "
    db "worry about it. "
    db "You just come   "
    db "back when you   "
    db "have more money,"
    db "little buddy.@"

Dialog04F:: ; Narrator
    db "You've got a    "
    db "Piece of Heart! "
    db "Press SELECT on "
    db "the Subscreen   "
    db "to see.@"

Dialog050:: ; Narrator
    db "You collected   "
    db "four Pieces of  "
    db "Heart.  Now, you"
    db "have a complete "
    db "Heart Container!@"

Dialog051:: ; Narrator
    db "Brrrr... This is"
    db "a block of solid"
    db "ice!  It's very "
    db "cold!@"

Dialog052:: ; Genie (D2 Nightmare)
    db "NYAH NYAH! You  "
    db "can't hurt me as"
    db "long as I have  "
    db "my bottle!@"

Dialog053:: ; Genie (D2 Nightmare)
    db "Waaaah! You- you"
    db "broke my bottle!"
    db "Why, you... You "
    db "make me hopping "
    db "mad!!!@"

Dialog054:: ; Tarin
    db "Well, #####, ya "
    db "finally snapped "
    db "out of it...    "
    db "Name's Tarin... "
    db "Hope yer feelin'"
    db "better...  What?"
    db "How did I know  "
    db "your name?  You "
    db "think it's weird"
    db "eh?  Well, I saw"
IF VERSION >= 2
    db "it on the back  "
    db "of this shield!@"
ELSE
    db "it on back of   "
    db "this shield!@"
ENDC

Dialog055:: ; Tarin
    db "Oh, yeah... Some"
    db "other stuff like"
    db "this washed up  "
    db "on the beach... "
    db "If'n you go look"
    db "watch out for   "
    db "monsters! Ever  "
    db "since you showed"
    db "up, #####, I've "
    db "seen 'em all    "
    db "over the place!@"

Dialog056:: ; Map
    db "Level 1--       "
    db "     Tail Cave@"

Dialog057:: ; Map
    db "Level 2--       "
    db "   Bottle Grotto@"

Dialog058:: ; Map
    db "Level 3--       "
    db "      Key Cavern@"

Dialog059:: ; Map
    db "Level 4--       "
    db " Angler's Tunnel@"

Dialog05A:: ; Map
    db "Level 5--       "
    db "   Catfish's Maw@"

Dialog05B:: ; Map
    db "Level 6--       "
    db "     Face Shrine@"

Dialog05C:: ; Map
    db "Level 7--       "
    db "   Eagle's Tower@"

Dialog05D:: ; Map
    db "Level 8--       "
    db "     Turtle Rock@"

Dialog05E:: ; Map
    db "Wind Fish's Egg @"

Dialog05F:: ; Map
Dialog060:: ; Map
    db "Mountain Bridge @"

Dialog061:: ; Map
    db "Sale's House O' "
    db "    Bananas@"

Dialog062:: ; Map
    db "Pothole Field@"

Dialog063:: ; Map
    db "    House By    "
    db "     The Bay@"

Dialog064:: ; Map
    db "   Trendy Game@"

Dialog065:: ; Map
    db "  Town Tool Shop@"

Dialog066:: ; Map
    db "Marin and       "
    db "   Tarin's House@"

Dialog067:: ; Map
    db "   Witch's Hut@"

Dialog068:: ; Map
    db "  Yarna Desert@"

Dialog069:: ; Map
    db "  Ukuku Prairie@"

Dialog06A:: ; Map
    db "Mysterious Woods@"

Dialog06B:: ; Map
    db "  Mt. Tamaranch @"

Dialog06C:: ; Map
    db "     Tal Tal    "
    db " Mountain Range @"

Dialog06D:: ; Map
    db "  Signpost Maze @"

Dialog06E:: ; Map
    db "  Mabe Village  @"

Dialog06F:: ; Map
    db " Animal Village @"

Dialog070:: ; Map
    db "    Cemetery    @"

Dialog071:: ; Map
    db "   Rapids Ride  @"

Dialog072:: ; Map
    db "Koholint Prairie@"

Dialog073:: ; Map
    db " Toronbo Shores@"

Dialog074:: ; Map
    db "  Martha's Bay@"

Dialog075:: ; Map
    db "East of the Bay@"

Dialog076:: ; Map
    db "  Goponga Swamp@"

Dialog077:: ; Map
    db "   Face Shrine @"

Dialog078:: ; Map
    db " Kanalet Castle@"

Dialog079:: ; Map
    db "Tal Tal Heights@"

Dialog07A:: ; Map
    db "Tabahl Wasteland@"

Dialog07B:: ; Map
    db "  South of the  "
    db "    Village@"

Dialog07C:: ; Map
    db "  Fishing Pond  @"

Dialog07D:: ; Map
    db "Madam MeowMeow's"
    db "     House      "
    db " Beware of Dog!@"

Dialog07E:: ; Map
    db "Old Man Ulrira's"
    db "     House      @"

Dialog07F:: ; Map
    db "Weird Mr. Write @"

Dialog080:: ; Map
    db " Crazy Tracy's  "
    db "  Health Spa@"

Dialog081:: ; Map
    db "Quadruplet's    "
    db "      House@"

Dialog082:: ; Map
    db "  Dream Shrine  @"

Dialog083:: ; Signpost
    db "Telephone Booth "
    db "<down> Signpost Maze @"

Dialog084:: ; Map
    db "Seashell Mansion@"

Dialog085:: ; Map
    db "Richard's Villa @"

Dialog086:: ; Map
    db "     Hen House  @"

Dialog087:: ; Map
    db "Village Library @"

Dialog088:: ; Map
    db "    Raft Shop   @"

Dialog089:: ; Map
    db "    Warp Hole   @"

Dialog08A:: ; Narrator
    db "This rock has   "
    db "many cracks...  "
    db "There must be   "
    db "some way to     "
    db "shatter it...@"

Dialog08B:: ; Narrator
    db "Oh? What a weird"
    db "object!  There  "
    db "must be some way"
    db "to tackle this  "
    db "obstacle.@"

Dialog08C:: ; Narrator
    db "Hunh?  This rock"
    db "has a key hole! "
    db "You should come "
    db "back with a key!@"

Dialog08D:: ; Narrator
    db "Wow!  This looks"
    db "pretty heavy!   "
    db "You won't be    "
    db "able to lift it "
    db "with just your  "
    db "bare hands...@"

Dialog08E:: ; Narrator
    db "Well, it's an   "
    db "Ocarina, but you"
    db "don't know how  "
    db "to play it...@"

Dialog08F:: ; Marin
    db "No!  No!  Poor  "
    db "hen!  Stop that!@"

Dialog090:: ; Narrator
    db "You found the   "
    db "Power Bracelet! "
    db "At last, you can"
    db "pick up pots and"
    db "stones!@"

Dialog091:: ; Narrator
    db "You got your    "
    db "shield back!    "
    db "Press the button"
    db "and repel       "
    db "enemies with it!@"

Dialog092:: ; Desert skull
    db "Ahhh... Yess... "
    db "That dust was so"
    db "refreshing...   "
    db "For that, I'll  "
    db "tell you a hint!"
    db "Use a Bomb in a "
    db "place where the "
    db "sand swallows   "
    db "you... There is "
    db "a treat on the  "
    db "other side of   "
    db "the wall... Bye!@"

Dialog093:: ; Narrator
    db "You've got the  "
    db "Hook Shot!  Its "
    db "chain stretches "
    db "long when you   "
    db "use it!@"

Dialog094:: ; Narrator
    db "You've got the  "
    db "Magic Rod!  Now "
    db "you can burn    "
    db "things! Burn it!"
    db "Burn, baby burn!@"

Dialog095:: ; Narrator
    db "You've got the  "
    db "Pegasus Boots!  "
    db "If you hold down"
    db "the Button, you "
    db "can dash!@"

Dialog096:: ; Narrator
    db "You've got the  "
    db "Ocarina!  You   "
    db "should learn to "
    db "play many songs!@"

Dialog097:: ; Narrator
    db "You've got the  "
    db "Roc's Feather!  "
    db "It feels like   "
    db "your body is a  "
    db "lot lighter!@"

Dialog098:: ; Narrator
    db "You've got a    "
    db "Shovel!  Now you"
    db "can feel the joy"
    db "of digging!@"

Dialog099:: ; Narrator
    db "You've got some "
    db "Magic Powder!   "
    db "Try sprinkling  "
    db "it on a variety "
    db "of things!@"

Dialog09A:: ; Narrator
    db "You've got a    "
    db "bomb! Way to    "
    db "go!@"

Dialog09B:: ; Narrator
    db "You found your  "
    db "Sword!  It must "
    db "be yours because"
    db "it has your name"
    db "engraved on it!@"

Dialog09C:: ; Narrator
    db "You've got the  "
    db "Flippers! If you"
    db "press the B     "
    db "Button while you"
    db "swim, you can   "
    db "dive underwater!@"

Dialog09D:: ; Narrator
    db "You've got the  "
    db "Magnifying Lens!"
    db "This will reveal"
    db "many things you "
    db "couldn't see    "
    db "before!@"

Dialog09E:: ; Narrator
Dialog09F:: ; Narrator
    db "You've got a    "
    db "new Sword!  You "
    db "should put your "
    db "name on it right"
    db "away!@"

Dialog0A0:: ; Narrator
    db "You found the   "
    db "secret medicine!"
    db "You should apply"
    db "this and see    "
    db "what happens!@"

Dialog0A1:: ; Narrator
    db "You've got the  "
    db "Tail Key!  Now  "
    db "you can open the"
    db "Tail Cave gate!@"

Dialog0A2:: ; Narrator
    db "You've got the  "
    db "Slime Key!  Now "
    db "you can open the"
    db "gate in Ukuku   "
    db "Prairie!@"

Dialog0A3:: ; Narrator
    db "You've got the  "
    db "Angler Key!@"
