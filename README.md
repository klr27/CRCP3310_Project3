# Data: Narrative, Meaning, and Discovery
## Project 3: Consuming Structured Data

Create a visualization informed by structured data obtained directly from an online API or downloaded as a CSV, XML or JSON document. You have a lot of flexibility here, and the two primary goals are to:
1. Explore the vast availability of data, which is a new “movement” since the turn of the century.
2. Demonstrate an ability to work with structured data.

### Requirements:
1. First, your program must either:
* Send an http request to a third party to obtain a response containing data in
either csv, xml or json format.
* Open a local csv, xml or json document.
2. The program should parse the data using an appropriate abstraction, and not treat the data as one big blob of text. For example, if your data is in JSON, you should be using some kind of JSON library and its API to traverse and parse the data.
3. Provide some means of interaction or automatically change what is displayed over time.
4. The domain of your data should fit a specific domain or goal. For example, using a
dataset about US pet deaths and the annual GDP of South Africa is a poor exploration.
5. Lastly, your program should use more than one data set, to demonstrate correlation,
differences, similarities, etc. The data sets can be of the same domain (eg. cat deaths in 2009, and dog deaths in 2009) or different, but related, domains.
