# System Maps with Graphviz

System Maps with Graphviz is a light-touch human-sourced method for capturing point-in-time
maps of the interconnections and couplings between components in systems.

The intent isn't to make them 100% accurate, but that's because very few maps are ever
100% accurate; instead, they are a tool for surfacing unseen coupling, SPoFs, humans as
critical parts of the system, and so forth. They're useful for capturing the real state
of the world from the minds of the people who know most about it, and usually reveal
surprising (to the creators) details which have either been forgotten or never really
known.

This method has been used at a number of large organisations over several years, and doesn't
have to be limited to just IT systems; you can capture maps of information flows between
departments, for example. The provided examples are all IT-based, but because this tool
is about capturing information and it's all human-sourced, based on oral tradition and
surfacing innate knowledge, you can use it for mapping any information system.

## Method

This is really basic, but it goes roughly like this:

1. Get people who know a system in a room. Starting with a whiteboard works well, though
   doing the capture live with a projector displaying the growing graph via `xdot` or the
   native Graphviz tool works better.
1. Start with one node in the system. Doesn't really matter where.
1. Iterate the following steps:
    1. Ask "what talks to this, and how?"
    1. Ask "does this produce any (reports, logs, documents, emails, messages, etc)?"
    1. Ask "are there any humans that interact with this system?"
    1. Capture that detail
    1. Repeat until done for now
1. Then, to refine the graph:
    1. Print the resulting graph, as big as you need to in order to be legible
    1. Stick the graph on a wall in a high-traffic area where people who might know something
       about the system will pass it, and be able to stop and peer at it without blocking
       traffic
    1. _Write_ on the graph, using a marker: `This graph is probably wrong. Please update it.`
    1. Hang the pen next to the graph
    1. Wait
    1. Once changes have been made to the graph, capture the changes in the source
    1. Repeat, optionally getting people back into a room to refine the graph in a more
       structured way

After a while, you'll have a pretty accurate picture of how things actually hang together.

### Notes and thoughts on graph elements

* Make it really, really clear that you are not capturing data to judge or blame. You
  are just trying to find out how things _really_ work so that you can all choose,
  clearly and rationally, what to address first (or whether to address anything at all).
  Make it very clear that it doesn't matter _how_ the system got to look like it does,
  and it doesn't matter _who_ made the system look like that. This is purely about
  trying to make a picture of reality, at a single point in time. Without this lack
  of potential blame, key data may be misrepresented, hidden, or "sanitised", and
  the graph will be wrong(er).
* Capture as much detail as you need, but try to keep it all at the same "level" otherwise
  it gets really confusing really fast. For example, capture all the inter-application data
  flows on one graph but don't try to represent the monitoring data flows on the same graph
  unless somehow the monitoring data interacts with the application data. Make a separate
  graph for the monitoring data flows.
* Don't forget to ask about data that flows through humans (eg emails forwarded, reports printed
  and posted out) and processes that are performed by humans (eg Emma fixes the database
  before doing the billing run every month). This will often be the most surprising and
  controversial part of the graph.
* It's pretty key and critical to do the print-it-and-let-people-draw-on-it phase. People
  won't remember, in the moment, exactly what connections and systems exist, but if the
  map is there as a constant reminder, and _if it changes occasionally_, then they'll
  be engaged to keep adding to it. It's important to let them draw on it because that's
  how you get spur-of-the-moment updates.
* Be aware that, when you add or remove nodes, or change connections between nodes,
  Graphviz (well, the `dot` renderer) will re-flow the whole graph. Things will be in a
  different place. This is a feature! It forces people to look at the graph as if it was
  completely new, and they see and capture systems and connections that would have been
  hidden before.
* Remember that this is a _process_. The first one will be wrong. The second one will, too.
  Even when you're "done", it will probably still be a bit wrong, but it'll be mostly
  right and then it starts being useful.
* If the graph starts getting too complex, check that you're capturing data at the same
  "level" and haven't let too much confounding data creep in. It's also quite possible
  that, yes, your system really is that complex and you're just going to have to print
  it on a bigger piece of paper. The record so far is `A0` just to be legible ...

## Displaying/printing

You'll need the `graphviz` tools; on Linux:

**Fedora:**

* `dnf install graphviz`

**Ubuntu:**

* `apt-get install graphviz`

**OSX:**

* `brew install graphviz`
* or you can download an OSX-native app from `graphviz.org`

**Windows:**

* TBA

Then, you can either use the native tools or the local `Makefile` to generate the output:

`make all`

For printing, `pdf` output is often the least inconsistent. For this, just do `make pdf`.
You can change to other output types at build time simply by prefixing the `make` command
with a `TYPE=...` assignment; eg `TYPE=svg make all`.  For a list of all possible
output formats, [see the graphviz documentation](http://www.graphviz.org/doc/info/output.html)
