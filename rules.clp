(defrule StartRule
    (Start)
    =>
    (retract *)
    (assert (pytanie "Which issue would you like to start with first?"))
    (assert (odpowiedzi "Financial issues" 
        "Phone breaking issues" 
        "Child's possible phone addiction" 
        "Number of phones" 
        "Child's behaviour issues"))
)

(defrule StartDropsRule
    (odpowiedz "Phone breaking issues")
    =>
    (retract *)
    (assert (pytanie "How will you feel when your kid drops and smashes the phone on the first day he has it?"))
    (assert (odpowiedzi "Now it looks like my phone. Neat!" 
        "Excuse me while I curl up in a ball and weep." 
        "Fine. I am a husk of my former self. I feel nothing."))
)

(defrule StartOnePhoneRule
    (odpowiedz "Number of phones")
    =>
    (retract *)
    (assert (pytanie "Just the one phone?"))
    (assert (odpowiedzi "Dude. This isn't The Wire. How many phones does she need?"))
)

(defrule MoochRule
    (odpowiedz "What? NO. Get a job, you mooch.")
    =>
    (retract *)
    (assert (ostateczna_odpowiedz "DON'T GET THE PHONE"
        "Why not spend that money on a Disney cruise? That should buy you at least a year."))
)

(defrule DropsOkRule
    (odpowiedz "Now it looks like my phone. Neat!")
    =>
    (retract *)
    (assert (pytanie "Will you pony up and get him another phone?"))
    (assert (odpowiedzi "Yes, but he will work it off with hard manual labour around the house until the end of days." 
        "What? NO. Get a job, you mooch." 
        "Whatever. I'm a human ATM."))
)

(defrule DropsCryRule
    (odpowiedz "Excuse me while I curl up in a ball and weep.")
    =>
    (retract *)
    (assert (pytanie "Will you pony up and get him another phone?"))
    (assert (odpowiedzi "Yes, but he will work it off with hard manual labour around the house until the end of days." 
        "What? NO. Get a job, you mooch." 
        "Whatever. I'm a human ATM."))
)

(defrule DropsSadRule
    (odpowiedz "Fine. I am a husk of my former self. I feel nothing.")
    =>
    (retract *)
    (assert (pytanie "Will you pony up and get him another phone?"))
    (assert (odpowiedzi "Yes, but he will work it off with hard manual labour around the house until the end of days." 
        "What? NO. Get a job, you mooch." 
        "Whatever. I'm a human ATM."))
)

(defrule SecondPhoneYesRule
    (odpowiedz "Yes, but he will work it off with hard manual labour around the house until the end of days.")
    =>
    (retract *)
    (assert (pytanie "Are you going to shell out extra money for Apple Care, extra insurance or an unbreakable case?"))
    (assert (odpowiedzi "Is there an unbreakable case I can shove my kid into?" 
        "Whatever. I'm a human ATM."))
)

(defrule ExtraMoneyAnsRule
    (odpowiedz "Is there an unbreakable case I can shove my kid into?")
    =>
    (retract *)
    (assert (ostateczna_odpowiedz "Don't get a phone." 
        "Why not spend that money on a Disney cruise? That should buy you at least a year."))
)


(defrule Bull1YesRule
    (odpowiedz "Um, yeah. Doi.")
    =>
    (retract *)
    (assert (pytanie "Are you being bullied right now?"))
    (assert (odpowiedzi "Yes. Hold me." 
        "No more than usual."))
)


(defrule RespondNoRule
    (odpowiedz "No. It's like I'm invisible. Can you see me?")
    =>
    (retract *)
    (assert (pytanie "Can you handle him losing his phone like, LITERALLY everywhere?"))
    (assert (odpowiedzi "Hang on. I can't find my phone. Can you call it?" 
        "Nope. SHUT IT DOWN."))
)

(defrule RespondYesRule
    (odpowiedz "I found this cell phone agreement online. She signed it, so I think we're good")
    =>
    (retract *)
    (assert (pytanie "HA HA good one. Do your kids always follow your rules"))
    (assert (odpowiedzi "HELL YEAH. They better." 
        "Of course. They are my sweet angels <3."))
)


(defrule LostNormalRule
    (odpowiedz "I guess not. Just leave me alone and let me drink.")
    =>
    (retract *)
    (assert (pytanie "Will you pony up and get him another phone?"))
    (assert (odpowiedzi "Yes, but he will work it off with hard manual labour around the house until the end of days." 
        "What? NO. Get a job, you mooch." 
        "Whatever. I'm a human ATM."))
)

(defrule LostNewKidRule
    (odpowiedz "This is my first day with my kid. We're still getting to know each other.")
    =>
    (retract *)
    (assert (pytanie "Will you pony up and get him another phone?"))
    (assert (odpowiedzi "Yes, but he will work it off with hard manual labour around the house until the end of days." 
        "What? NO. Get a job, you mooch."
        "Whatever. I'm a human ATM."))
)

(defrule PuppyYesRule
    (odpowiedz "Yes. Finally, I shall be crowned as the greatest parent ever. Bow to me!")
    =>
    (retract *)
    (assert (ostateczna_odpowiedz "WHY ARE YOU EVEN ASKING?"
        "Get a phone, live your life and savour this beautiful time together."))
)

(defrule PuppyNoRule
    (odpowiedz "No. I mean, maybe? IDK, I'm so tired.")
    =>
    (retract *)
    (assert (pytanie "If you say yes, can you use this as leverage to get something you want?"))
    (assert (odpowiedzi "Sweet. I can get a hot tub in the backyard!"))
)

(defrule LeverageGoodRule
    (odpowiedz "Sweet. I can get a hot tub in the backyard!")
    =>
    (assert (ostateczna_odpowiedz "GET THE PHONE AND DON'T LOOK BACK"
        "You're aware of all the frustrations, tears and money you'll go through, but it's still worth it. 
        It's like having kids except phones are way cooler."))
)

(defrule StartBankrollingRule
    (odpowiedz "Financial issues")
    =>
    (retract *)
    (assert (pytanie "Are you bankrolling this entire enterprise, player?"))
    (assert (odpowiedzi "They pay half, I pay half. JK, I pay for most of it." 
        "Yes. Against all scientific odds, I am made of money." 
        "No, my kid's take-home pay is higher than mine, so he's paying for all of it."))
)

(defrule PayHalfRule
    (odpowiedz "They pay half, I pay half. JK, I pay for most of it.")
    =>
    (retract *)
    (assert (pytanie "Who will spend their hard-earned cash on apps, overages and other charges your kid makes 'by mistake?'"))
    (assert (odpowiedzi "She will. I mentioned it twice, so I think she gets it." 
        "Whatever. I'm a human ATM."))
)

(defrule MadeOfMoneyRule
    (odpowiedz "Yes. Against all scientific odds, I am made of money.")
    =>
    (retract *)
    (assert (pytanie "Who will spend their hard-earned cash on apps, overages and other charges your kid makes 'by mistake?'"))
    (assert (odpowiedzi "She will. I mentioned it twice, so I think she gets it." 
        "Whatever. I'm a human ATM."))
)

(defrule TakeHomePayRule
    (odpowiedz "No, my kid's take-home pay is higher than mine, so he's paying for all of it.")
    =>
    (retract *)
    (assert (ostateczna_odpowiedz "WHY ARE YOU EVEN ASKING?" 
        "Get a phone, live your life and savour this beautiful time together."))
)

(defrule KidPaysRule
    (odpowiedz "She will. I mentioned it twice, so I think she gets it.")
    =>
    (retract *)
    (assert (pytanie "Do you have a HUMAN child?"))
    (assert (odpowiedzi "Kinda? I have a robot I built in my basement. I named him Kevin."))
)

(defrule HumanATMRule
    (odpowiedz "Whatever. I'm a human ATM.")
    =>
    (retract *)
    (assert (ostateczna_odpowiedz "GET THE PHONE AND DON'T LOOK BACK"
        "You're aware of all the frustrations, tears and money you'll go through, but it's still worth it. 
        It's like having kids except phones are way cooler."))
)

(defrule OnePhoneAnsRule
    (odpowiedz "Dude. This isn't The Wire. How many phones does she need?")
    =>
    (retract *)
    (assert (pytanie "Mmm-hmm. What will you do next year when she wants a new phone?"))
    (assert (odpowiedzi "I will tell the story of how we used to use land lines. And make her clean out the garage." "Whatever. I'm a human ATM."))
)

(defrule LandLinesRule
    (odpowiedz "I will tell the story of how we used to use land lines. And make her clean out the garage.")
    =>
    (retract *)
    (assert (pytanie "Are you going to shell out extra money for Apple Care, extra insurance or an unbreakable case?"))
    (assert (odpowiedzi "Is there an unbreakable case I can shove my kid into?"))
)

(defrule StartWhiningRule
    (odpowiedz "Child's behaviour issues")
    =>
    (retract *)
    (assert (pytanie "Are you about to snap under the crushing weight of constant whining?"))
    (assert (odpowiedzi "Actually, he never brought it up. I was just thinking..." 
        "She just won't stop. MAKE IT STOP." 
        "Yes. This is all my kid talks about. I am slowly dying."))
)

(defrule NeverBroughItUpRule
    (odpowiedz "Actually, he never brought it up. I was just thinking...")
    =>
    (retract *)
    (assert (ostateczna_odpowiedz "DON'T GET THE PHONE"
        "Why not spend that money on a Disney cruise? That should buy you at least a year."))
)

(defrule ImSlowlyDyingRule
    (odpowiedz "Yes. This is all my kid talks about. I am slowly dying.")
    =>
    (retract *)
    (assert (pytanie "Do you and your kid know about bullying?"))
    (assert (odpowiedzi "Um, yeah. Doi."))
)

(defrule MakeItStopRule
    (odpowiedz "She just won't stop. MAKE IT STOP.")
    =>
    (retract *)
    (assert (pytanie "Are you bankrolling this entire enterprise, player?"))
    (assert (odpowiedzi "They pay half, I pay half. JK, I pay for most of it." 
        "Yes. Against all scientific odds, I am made of money." 
        "No, my kid's take-home pay is higher than mine, so he's paying for all of it."))
)

(defrule StartNeverLooksUpRule
    (odpowiedz "Child's possible phone addiction")
    =>
    (retract *)
    (assert (pytanie "Do you mind if your kid never looks up from her phone again?"))
    (assert (odpowiedzi "Actually, I have strict rules about the amount of time she will spend on her phone." 
        "One sec, I'm just finishing a game of Bejeweled."))
)

(defrule OneSecRule
    (odpowiedz "One sec, I'm just finishing a game of Bejeweled.")
    =>
    (retract *)
    (assert (pytanie "Can you handle him losing his phone like, LITERALLY everywhere?"))
    (assert (odpowiedzi "Hang on. I can't find my phone. Can you call it?" 
        "Nope. SHUT IT DOWN."))
)

(defrule CantFindMyPhoneRule
    (odpowiedz "Hang on. I can't find my phone. Can you call it?")
    =>
    (retract *)
    (assert (pytanie "Are you seriously shocked that he lost his phone?"))
    (assert (odpowiedzi "I guess not. Just leave me alone and let me drink." 
        "This is my first day with my kid. We're still getting to know each other."))
)

(defrule ShutItDownRule
    (odpowiedz "Nope. SHUT IT DOWN.")
    =>
    (retract *)
    (assert (pytanie "Are you seriously shocked that he lost his phone?"))
    (assert (odpowiedzi "I guess not. Just leave me alone and let me drink." 
        "This is my first day with my kid. We're still getting to know each other."))
)

(defrule StrictRulesRule
    (odpowiedz "Actually, I have strict rules about the amount of time she will spend on her phone.")
    =>
    (retract *)
    (assert (pytanie "HA HA good one. Do your kids always follow your rules"))
    (assert (odpowiedzi "HELL YEAH. They better." 
        "Of course. They are my sweet angels <3."))
)

(defrule HellYeahRule
    (odpowiedz "HELL YEAH. They better.")
    =>
    (retract *)
    (assert (pytanie "Do you think she will answer your urgent calls and texts right away/quickly/ever?"))
    (assert (odpowiedzi "No. It's like I'm invisible. Can you see me?" 
        "I found this cell phone agreement online. She signed it, so I think we're good"))
)

(defrule SweetAngelsRule
    (odpowiedz "Of course. They are my sweet angels <3.")
    =>
    (retract *)
    (assert (pytanie "Do you have a HUMAN child?"))
    (assert (odpowiedzi "Kinda? I have a robot I built in my basement. I named him Kevin."))
)

(defrule RobotRule
    (odpowiedz "Kinda? I have a robot I built in my basement. I named him Kevin.")
    =>
    (retract *)
    (assert (ostateczna_odpowiedz "BUY KEVIN A PHONE!"
        "And congrats on creating your own A.I. Can you build me a Kevin too?"))
)

(defrule HoldMeRule
    (odpowiedz "Yes. Hold me.")
    =>
    (retract *)
    (assert (pytanie "Have you also promised her a puppy?"))
    (assert (odpowiedzi "No. I mean, maybe? IDK, I'm so tired." 
        "Yes. Finally, I shall be crowned as the greatest parent ever. Bow to me!"))
)

(defrule NoMoreThanUsualRule
    (odpowiedz "No more than usual.")
    =>
    (retract *)
    (assert (pytanie "If you say yes, can you use this as leverage to get something you want?"))
    (assert (odpowiedzi "Sweet. I can get a hot tub in the backyard!"))
)