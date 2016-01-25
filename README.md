## OVERVIEW

I couldn't wrap me freaking head around CIG making 75k a day off idiots.
So I tried to break it down. Then I wrote a compy prog for it.


## DESCRIPTION

This was originally designed to calculate the number of daily purchases for different SC "purchase groups" given:
 1. Their price-point
 2. What percent of the daily SC revenue that group contributed to

### Example:

4 package type "groups"
 * base: $45
 * believer: $100 (avg)
 * whale: $500 (avg)
 * sperg whale: $1000 (avg)

Assume $75,000 per day.

100% base
 * 1667 Purchases Per Day (PPD)
 * 608,455 Purchases Per Year (PPY)

50% base, 50% believer
 * 1208 PPD
 * 440,920 PPY

25% base, 65% believer, 10% whale
 * 920 PPD
 * 335,800 PPY

100% believer
 * 750 PPD
 * 273,750 PPY

10% base, 25% believer, 65% whale
 * 453 PPD
 * 165,345 PPY

100% whale
 * 150 PPD
 * 54,750 PPY

100% sperg whale
 * 75 PPD
 * 27,375 PPY


## USAGE

### To use this sperg calculator, call the rake tasks.

Use this handy task to calculate daily theoretical sperg jpeg waste
    $ rake calculate

Specify what the daily revenue was that day!
    $ rake calculate daily_revenue="some assinine amount"

 * Note: We are working on 64-bit precision data for the daily_revenue, expect that in two weeks

Tweak the numbers to craft your own personal sperg's mom's credit-card-backed distribution profile!!!
Just check out sperg_config.yml

We express distinct groups of sperg-delusion as averaged jpeg price-points,
and specify what percentage of the daily aggregate that particular(ly sad) group
contributed to Crobber's Hollywood/Coke fund.

### Here's a pretty sweet example!!

distribution:
  base:
    price: 45
    percent: 25

  believer:
    price: 100
    percent: 50

  whale:
    price: 500
    percent: 15

  sperg_whale:
    price: 1000
    percent: 10


### Usage with Sample Output:
$ rake calculate

        BASE (25%):
          419 Purchases Per Day
          152,938 Purchases Per Year

        BELIEVER (50%):
          378 Purchases Per Day
          137,973 Purchases Per Year

        WHALE (15%):
          25 Purchases Per Day
          9,128 Purchases Per Year

        SPERG_WHALE (10%):
          10 Purchases Per Day
          3,653 Purchases Per Year

        Totals:
          1,192 Purchases Per Day
          432,861 Purchases Per Year

$

### NOTE ABOUT INACCURACIES (Think CIG positive!!)
  You might notice the numbers don't add up
  Don't worry about that. We assume a minimum of $3,000,000 in revenue per month and adjust
  all the rest of the numbers if our daily_revenue didn't match that minimum income to
  "keep the lights on" (*wink wink* right Chris?)
  Don't wanna spook the whales LOL!!

### Curous about how CIG's funding is going? ME TOO!! Well NOW YOU CAN!!!

    $ rake funds:remaining
      PLENTY!

    $ rake funds:audit
      PLENTY! Haha we have enough to make this game twice! LOOK!!! JPEG!! SPECIAL!! FOR YOUUU!!!

#### You can even specify who the auditor is!

    $ rake funds:audit auditor="karl"
      You're not an auditor, Karl. JPEG store is --->

    $ rake funds:audit auditor="person with pubes"
      SHAVE YOUR FUCKING PUBES YOU HEATHEN!!!!!
      Plenty of cash left hahaha no seriously, nothing to worry about!

    $ rake funds:audit auditor="bird"
      SQUAAAK!!!
