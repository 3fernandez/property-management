## Solution
### Overview
In this solution, I focused on implementing the event-driven architecture, which I found to be the most interesting and challenging aspect of the assignment. While I couldn't complete all the requirements within the given time frame, I wanted to showcase my understanding of event-driven concepts within the Ruby/Rails ecosystem.

### Event-Driven Architecture
To implement the event-driven architecture, I opted for a very simple approach instead of a more complex approach using tools like [Rails Event Store](https://railseventstore.org/docs/v2/start/) for example. I worked on some projects(a long time ago) that relied on these tools, and I know some headaches that may come along with them.
The main idea is to store Aggregates and Events in a relational database. Each Aggregate, such as properties, has an associated Event table(e.g., property_events), when events are created, they are applied to the aggregates synchronously within a SQL transaction.
You can find the implementation details, including the structure of the events table and the BaseEvent class that all event classes inherit from, in the code.

### Missing Requirements
Although I couldn't complete all the requirements, I want to outline how I would approach one of the missing requirements as an example.

- Assigning properties to real estate agents: To implement this feature, I would create a new table/model for Agents. Then, I would create an API endpoint that accepts Agent parameters or an ID.
When called, this endpoint would create a new event (inheriting from the BaseEvent class) that associates the Agent with an existing property through a join table.

<br/><br/>

And last, but not least, *Dave "Prag Dave" Thomas* once said:
> Perfection is the enemy of progress.
