# Gilded rose tech test

- I have completed the js-jasmine version of this kata. I'm now working on ruby.

## My approach - Ruby

- Having done the kata once before, I was obviously at an advantage. My first step has been to make the failing test pass, and add basic tests for normal items depreciating in quality and sell by date. I have also refactored the test to use a group. This will make writing further tests more straightforward.
- I proceeded to write full, detailed test suites for the other categories of items, so that I could refactor knowing it would be easy to identify what i had broken, if I broke anything.
- I then started refactoring, first changed the .each method to .map, since the iteration in question here is about transforming the data.
- I followed a similar process as with my javascript version of the problem. However I followed a slightly different order. I did the guard condition for Sulfuras first, which doesn't get changed at all. I then made increasing and decreasing the quality (unless minimum or maximum reached into private methods so they could easily be called in update_quality.
- As with the js version, I then added standalone private methods for special categories (brie and backstage passes) and then for normal items.
- I decided to use a case/when statement in my backstage passes method, as this avoids the need for any nested if conditions. It also enabled me to use the .times method on my increase_quality method, making this code very easy to change (only 1 number needs to change to increase or decrease quality faster or slower)
- I used if/else statements for normal items and brie being within or beyond the sell by date for the same reason.
- Accounting for conjured items was then super straightforward. I wrote the test suite first, saw it fail, then added a method to find conjured items and simply call the method for normal items twice.
- I still feel my update quality method is too long; I can't think of further ways to simplify it at the moment but will keep thinking.

## Kata details

This is a well known kata developed by Terry Hughes. This is commonly used as a tech test to assess a candidate's ability to read, refactor and extend legacy code.

Here is the text of the kata:

\*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

Once the sell by date has passed, Quality degrades twice as fast
The Quality of an item is never negative
???Aged Brie??? actually increases in Quality the older it gets
The Quality of an item is never more than 50
???Sulfuras???, being a legendary item, never has to be sold or decreases in Quality
???Backstage passes???, like aged brie, increases in Quality as it???s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
We have recently signed a supplier of conjured items. This requires an update to our system:

???Conjured??? items degrade in Quality twice as fast as normal items
Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn???t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we???ll cover for you)."\*

# Gilded Rose Refactoring Kata

This Kata was originally created by Terry Hughes (http://twitter.com/TerryHughes). It is already on GitHub [here](https://github.com/NotMyself/GildedRose). See also [Bobby Johnson's description of the kata](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/).

I translated the original C# into a few other languages, (with a little help from my friends!), and slightly changed the starting position. This means I've actually done a small amount of refactoring already compared with the original form of the kata, and made it easier to get going with writing tests by giving you one failing unit test to start with. I also added test fixtures for Text-Based approval testing with TextTest (see [the TextTests](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/master/texttests))

As Bobby Johnson points out in his article ["Why Most Solutions to Gilded Rose Miss The Bigger Picture"](http://iamnotmyself.com/2012/12/07/why-most-solutions-to-gilded-rose-miss-the-bigger-picture), it'll actually give you
better practice at handling a legacy code situation if you do this Kata in the original C#. However, I think this kata
is also really useful for practicing writing good tests using different frameworks and approaches, and the small changes I've made help with that. I think it's also interesting to compare what the refactored code and tests look like in different programming languages.

I use this kata as part of my work as a technical coach. I wrote a lot about the coaching method I use in this book [Technical Agile Coaching with the Samman method](https://leanpub.com/techagilecoach). A while back I wrote this article ["Writing Good Tests for the Gilded Rose Kata"](http://coding-is-like-cooking.info/2013/03/writing-good-tests-for-the-gilded-rose-kata/) about how you could use this kata in a [coding dojo](https://leanpub.com/codingdojohandbook).

## How to use this Kata

The simplest way is to just clone the code and start hacking away improving the design. You'll want to look at the ["Gilded Rose Requirements"](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/master/GildedRoseRequirements.txt) which explains what the code is for. I strongly advise you that you'll also need some tests if you want to make sure you don't break the code while you refactor.

You could write some unit tests yourself, using the requirements to identify suitable test cases. I've provided a failing unit test in a popular test framework as a starting point for most languages.

Alternatively, use the "Text-Based" tests provided in this repository. (Read more about that in the next section)

Whichever testing approach you choose, the idea of the exercise is to do some deliberate practice, and improve your skills at designing test cases and refactoring. The idea is not to re-write the code from scratch, but rather to practice designing tests, taking small steps, running the tests often, and incrementally improving the design.

### Gilded Rose Requirements in other languages

- [English](GildedRoseRequirements.txt)
- [Espa??ol](GildedRoseRequirements_es.md)
- [Fran??ais](GildedRoseRequirements_fr.md)
- [?????????](GildedRoseRequirements_jp.md)
- [Portugu??s](GildedRoseRequirements_pt-BR.md)
- [??????????????](GildedRoseRequirements_ru.txt)
- [?????????](GildedRoseRequirements_th.md)
- [??????](GildedRoseRequirements_zh.txt)
- [?????????](GildedRoseRequirements_kr.md)

## Text-Based Approval Testing

This code comes with comprehensive tests that use this approach. For information about how to run them, see the [texttests README](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/master/texttests)

## Translating this code

More translations are most welcome! I'm very open for pull requests that translate the starting position into additional languages.

Please note a translation should ideally include:

- a translation of the production code for 'update_quality' and Item
- one failing unit test complaining that "fixme" != "foo"
- a TextTest fixture, ie a command-line program that runs update_quality on the sample data for the number of days specified.

Please don't write too much code in the starting position or add too many unit tests. The idea with the one failing unit test is to tempt people to work out how to fix it, discover it wasn't that hard, and now they understand what this test is doing they realize they can improve it.

If your programming language doesn't have an easy way to add a command-line interface, then the TextTest fixture is probably not necessary.

## Better Code Hub

I analysed this repo according to the clean code standards on [Better Code Hub](https://bettercodehub.com) just to get an independent opinion of how bad the code is. Perhaps unsurprisingly, the compliance score is low!

[![BCH compliance](https://bettercodehub.com/edge/badge/emilybache/GildedRose-Refactoring-Kata?branch=master)](https://bettercodehub.com/)
