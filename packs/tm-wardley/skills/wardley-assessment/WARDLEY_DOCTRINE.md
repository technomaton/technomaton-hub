<!-- Source: Simon Wardley, "Wardley Maps" book, CC-BY-SA-4.0 -->
<!-- Adapted for AI agent consumption by TECHNOMATON -->

# Wardley Doctrine -- 40 Universal Principles

## 1. What is Doctrine?

Doctrine is the set of **universal principles** that apply regardless of context. Unlike strategic plays -- which are context-dependent choices about where to compete, what to exploit, and how to attack or defend -- doctrine is what every organization should always be doing.

**Doctrine vs. Strategy:**

| Aspect | Doctrine | Strategy |
|--------|----------|----------|
| Scope | Universal -- applies everywhere | Context-specific -- depends on landscape |
| Stability | Persistent -- rarely changes | Adaptive -- changes as the map changes |
| Nature | Good practice, organizational hygiene | Competitive moves, positioning, gameplay |
| Examples | "Be transparent," "Know your users" | "Open-source the component to commoditize it" |
| Assessment | Can be scored against any organization | Can only be evaluated relative to a specific map |

**Purpose:** Doctrine provides a baseline organizational health check independent of market position. An organization that scores poorly on doctrine will struggle to execute any strategy effectively. It is the foundation upon which strategic capability is built.

**Key insight:** You cannot compensate for poor doctrine with brilliant strategy. An organization that hoards information, ignores user needs, and resists change will fail regardless of how clever its competitive moves are. Fix doctrine first.

---

## 2. The 40 Doctrine Principles

### Category 1: Communication

These principles govern how information flows within and around the organization. Communication failures cascade into every other category.

---

#### Principle 1: Be Transparent

**Share information openly. Default to visible. Avoid information hoarding.**

What it means in practice: All relevant data, maps, plans, and reasoning should be accessible to anyone who needs them. Decisions are made in the open with documented rationale. There are no secret strategies hidden from the people who must execute them.

**Anti-pattern:** Information silos where teams hoard data for political advantage. Decisions made behind closed doors with no documented reasoning. "Need to know" culture applied to operational information rather than genuinely sensitive material.

**Detection signal:** Ask whether strategy documents, roadmaps, performance data, and decision logs are accessible to all team members. If people report being surprised by decisions or lacking context for their work, transparency is weak.

---

#### Principle 2: Challenge Assumptions

**Actively question received wisdom. Treat "we've always done it this way" as a warning sign.**

What it means in practice: Every significant decision or established practice should be open to challenge regardless of who originated it. The organization has explicit mechanisms -- retrospectives, pre-mortems, red teams -- for questioning the status quo. Sacred cows are identified and examined.

**Anti-pattern:** Unquestioned legacy decisions that persist for years. Teams that cannot articulate why they follow a particular process beyond "that's how we do it." Leaders who interpret challenges to their ideas as personal attacks.

**Detection signal:** Look for evidence of practices being deliberately re-evaluated. Ask when the last significant process or tool was changed and why. If nothing has been challenged in the past year, this principle is weak.

---

#### Principle 3: Focus on User Needs

**All decisions trace back to user value. If you cannot draw a line from an activity to a user need, question the activity.**

What it means in practice: The organization can articulate who its users are and what they need. Every project, feature, and initiative has a documented connection to a user need. Work that cannot be traced to user value is deprioritized or eliminated.

**Anti-pattern:** Building features because competitors have them, because an executive demanded them, or because the technology is exciting. Long backlogs of work with no clear user justification. Inability to answer "who benefits from this and how?"

**Detection signal:** Ask teams to name their primary users and their top three needs. If answers are vague, inconsistent across the organization, or focused on internal stakeholders rather than end users, this principle is weak.

---

#### Principle 4: Remove Bias and Stigma

**Separate the idea from the originator. Evaluate proposals on merit, not on who proposed them.**

What it means in practice: A good idea from a junior engineer receives the same consideration as one from the CTO. Failed experiments are treated as learning, not career damage. The organization actively works against HiPPO (Highest Paid Person's Opinion) culture and cognitive biases in decision-making.

**Anti-pattern:** Ideas accepted or rejected based on seniority or political capital. Blame culture around failures that discourages experimentation. Innovation only flowing top-down. "Not invented here" syndrome blocking external ideas.

**Detection signal:** Examine where recent adopted ideas originated. If they all came from leadership, bias is present. Check whether anyone has been penalized for a failed experiment. If failure carries stigma, this principle is weak.

---

#### Principle 5: Use a Common Language

**Shared terminology reduces miscommunication. Wardley Mapping itself serves as a common language tool.**

What it means in practice: The organization has an agreed-upon vocabulary for discussing strategy, components, evolution, and value chains. When someone says "commodity" or "user need," everyone in the room understands the same definition. Maps provide a visual shared language that transcends departmental jargon.

**Anti-pattern:** Marketing, engineering, and operations each using different terms for the same concept. Strategy discussions that devolve into definitional arguments. No shared framework for discussing where components are in their evolution.

**Detection signal:** Present a component and ask different teams to describe its evolution stage. If they use inconsistent terminology or cannot agree on what "mature" or "innovative" means, a common language is absent.

---

#### Principle 6: Think Small (Teams)

**Small, focused teams outperform large ones. Keep teams sized for effective communication.**

What it means in practice: Teams are organized around components or user needs, not around organizational hierarchy. Team size stays within the range where every member knows what every other member is working on (typically 5-9 people). Large initiatives are decomposed into work for small teams rather than scaling up team size.

**Anti-pattern:** Teams of 20+ people with coordination overhead consuming a significant fraction of capacity. "War rooms" as a permanent state rather than a temporary crisis response. Multiple layers of management between the people doing work and the people making decisions.

**Detection signal:** Count the number of people in the average team or project group. If teams regularly exceed 10 people, or if significant effort goes to cross-team coordination meetings rather than execution, this principle is weak.

---

#### Principle 7: Use Appropriate Methods

**Match methodology to component evolution stage. Agile for Genesis, Lean for Custom-Built, Six Sigma for Commodity.**

What it means in practice: The organization recognizes that a single methodology cannot serve all components. Novel, uncertain work (Genesis) is managed with exploration-friendly methods like agile and rapid prototyping. Established, commodity work is managed with efficiency-focused methods like Six Sigma and automation. The choice of method is deliberate, not dogmatic.

**Anti-pattern:** Applying one methodology everywhere. Running agile sprints on commodity infrastructure maintenance. Demanding waterfall plans for a Genesis-stage experiment. "We are an agile shop" applied universally without regard to what is being built.

**Detection signal:** Ask how the organization decides which methodology to use for a given project. If the answer is "we use [X] for everything," this principle is violated. If different teams use different methods matched to the nature of their work, it is being practiced.

---

#### Principle 8: Be Humble

**Accept uncertainty. Admit what you do not know. Treat certainty about the future as a warning sign.**

What it means in practice: Leaders openly acknowledge gaps in their knowledge. Forecasts and plans include explicit uncertainty ranges. The organization values "I don't know, let's find out" over confident guessing. Humility extends to recognizing that competitors may have better ideas.

**Anti-pattern:** Leaders who project unwarranted certainty. Five-year strategic plans presented as definitive. Inability to say "we were wrong" when evidence contradicts a previous decision. Dismissing competitor approaches without examination.

**Detection signal:** Look for language of uncertainty in planning documents -- ranges, scenarios, explicit assumptions. If all plans present a single confident forecast with no acknowledgment of unknowns, humility is lacking.

---

#### Principle 9: A Bias Towards the New

**Prefer novelty over habit when evidence supports the change. Do not cling to the familiar simply because it is comfortable.**

What it means in practice: When a new approach demonstrates clear advantages, the organization adopts it even if the existing approach is "working fine." There is a systematic process for evaluating emerging tools, practices, and technologies. Inertia is recognized as a force to actively counter rather than a default state to accept.

**Anti-pattern:** Sticking with outdated tools or practices because switching costs feel high. Evaluating new approaches with impossible standards ("prove it's ten times better") while granting incumbents a free pass. Innovation theater -- talking about the new while continuing the old.

**Detection signal:** Ask when the organization last adopted a fundamentally new tool, practice, or approach. If the answer is measured in years, or if every evaluation of something new ends with "we'll stick with what we have," this principle is weak.

---

#### Principle 10: Listen to Your Ecosystems

**Pay attention to signals from users, partners, competitors, and adjacent industries. The landscape is speaking.**

What it means in practice: The organization has systematic channels for capturing ecosystem signals -- customer feedback, partner input, competitor analysis, industry trend monitoring. These signals feed into strategic discussions. There is a regular cadence of landscape review, not just annual strategic planning.

**Anti-pattern:** Ignoring customer complaints because "they don't understand our strategy." Being surprised by competitor moves. No systematic mechanism for scanning adjacent industries for relevant developments. Strategy created in an internal vacuum.

**Detection signal:** Ask how the organization captures and processes external signals. If there is no regular mechanism, or if ecosystem data is collected but never acted upon, this principle is weak. Look for evidence of strategy changing in response to external signals.

---

### Category 2: Development

These principles govern how the organization builds, creates, and evolves its offerings. They determine the quality and efficiency of value creation.

---

#### Principle 11: Know Your Users

**Deeply understand who you serve and why. Build detailed, evidence-based models of user behavior and needs.**

What it means in practice: The organization has specific, named user personas grounded in research rather than assumption. Teams regularly interact with actual users through interviews, observation, and data analysis. User understanding is continuously updated, not a one-time exercise.

**Anti-pattern:** Personas based on internal assumptions with no user research. "We know what users want" without evidence. Conflating the buyer with the user. Building for an imagined user who matches what the team wants to build.

**Detection signal:** Ask to see user research artifacts -- interview transcripts, survey results, behavioral data, personas. If these do not exist, or if they are more than a year old with no updates, this principle is weak.

---

#### Principle 12: Focus on User Needs (Not Yours)

**Build what users need, not what you want to build. Distinguish between user pull and technology push.**

What it means in practice: Feature decisions are driven by validated user needs, not by engineering interest or executive pet projects. When conflict exists between what is technically exciting and what users need, user needs win. The organization has a mechanism for distinguishing "users are asking for this" from "we think users should want this."

**Anti-pattern:** Shiny-object syndrome where teams pursue technically interesting work that users never asked for. Roadmaps driven by what the team wants to learn rather than what users need. Post-hoc rationalization of desired features as user needs.

**Detection signal:** Trace recent feature decisions back to their origin. If most originated from engineering or leadership rather than user feedback or data, this principle is weak. Ask "what user need does this serve?" -- if the team has to think hard to answer, it is likely technology-push.

---

#### Principle 13: Think FIRE

**Fast, Inexpensive, Restrained, and Elegant. Favor simplicity over complexity in everything you build.**

What it means in practice: Solutions are designed to be the simplest viable approach. Over-engineering is treated as a defect, not a virtue. The organization values speed of delivery and restraint in scope. Elegance means achieving the goal with minimum unnecessary complexity, not adding decorative features.

**Anti-pattern:** Gold-plating features that no one asked for. Architectures designed for scale that will never be reached. Month-long design phases for problems that could be solved with a quick prototype. Conflating complexity with sophistication.

**Detection signal:** Examine recent deliverables for unnecessary complexity. Ask teams how they decide "enough." If there is no mechanism for constraining scope, or if "we might need it later" justifies current complexity, this principle is weak.

---

#### Principle 14: Use Appropriate Tools

**Match tools to the job, not the other way around. Do not let tool familiarity dictate solution design.**

What it means in practice: Tool selection is driven by the problem at hand, not by what the team already knows. The organization evaluates tools objectively against requirements. There is willingness to adopt unfamiliar tools when they are demonstrably better suited. Conversely, there is no compulsion to adopt new tools just because they are new.

**Anti-pattern:** Using a relational database for graph problems because "we know PostgreSQL." Adopting Kubernetes for a single-container application because it is trendy. Choosing tools based on resume value rather than fitness for purpose.

**Detection signal:** Ask why specific tools were chosen for recent projects. If the answer is "it's what we know" or "everyone uses it," tool selection is not being deliberated. If the answer references specific requirements the tool satisfies, it is.

---

#### Principle 15: Manage Failure

**Plan for failure, learn from it, do not punish it. Distinguish between good failure (learning) and bad failure (negligence).**

What it means in practice: The organization conducts blameless post-mortems after incidents and failed experiments. Failed experiments in Genesis-stage work are expected and budgeted for. There is a clear distinction between failure from experimentation (acceptable, even desirable) and failure from negligence or known-bad practices (not acceptable).

**Anti-pattern:** Blame culture where individuals are punished for failed experiments. No post-mortems or retrospectives after failures. Treating all failure as equally bad regardless of context. Avoiding risk entirely to avoid failure.

**Detection signal:** Ask what happened after the last significant failure. If people were penalized, or if there was no structured learning process, failure management is poor. If post-mortems were conducted and changes resulted, it is present.

---

#### Principle 16: Be Pragmatic

**Perfect is the enemy of good. Ship what works, improve iteratively, and accept that "good enough" is often optimal.**

What it means in practice: The organization values working solutions over perfect designs. There is a clear concept of "minimum viable" for each context. Teams are empowered to make pragmatic trade-offs between ideal and achievable. Technical debt is managed, not forbidden.

**Anti-pattern:** Endless refactoring cycles that delay delivery. Rejecting solutions because they are not architecturally pure. Analysis paralysis driven by the desire to find the optimal solution before acting. Treating all technical debt as unacceptable.

**Detection signal:** Ask how long the last major deliverable took from concept to first deployment. If the timeline was dominated by design and review rather than building and shipping, pragmatism is lacking. If teams regularly ship and iterate, it is present.

---

#### Principle 17: Use Standards Where Appropriate

**Do not reinvent the wheel for Commodity components. Adopt industry standards for well-understood problems.**

What it means in practice: The organization actively identifies components that have reached Commodity or Product stage and adopts existing standards rather than building bespoke solutions. Custom work is reserved for components where differentiation matters. Standards adoption is a deliberate decision, not accidental convergence.

**Anti-pattern:** Building a custom authentication system when OAuth2/OIDC exists. Creating proprietary data formats when industry standards are available. Treating every problem as unique when many have standardized solutions. "Not invented here" applied to commodity components.

**Detection signal:** Survey the technology stack for commodity components. If the organization has custom-built solutions for problems with well-established standards (logging, auth, monitoring, messaging), this principle is being violated.

---

#### Principle 18: Optimise Flow

**Remove bottlenecks and unnecessary handoffs. Value flows from idea to user -- clear the path.**

What it means in practice: The organization maps its delivery pipeline and actively identifies bottlenecks, unnecessary approvals, and handoff delays. Lead time from decision to deployment is measured and optimized. Cross-functional teams reduce handoffs. Automation replaces manual gates where possible.

**Anti-pattern:** Multi-week approval chains for routine changes. Separate teams for development, testing, deployment, and operations with handoff queues between each. Work sitting in queues longer than it takes to actually complete. Value stream mapping never performed.

**Detection signal:** Measure the time from "work item started" to "value delivered to user." If this time is dominated by waiting rather than working, flow is not optimized. Ask teams to identify their top bottleneck -- if they can name it instantly, they are aware; if it persists, they cannot fix it.

---

#### Principle 19: Think Aptitude and Attitude

**Hire for attitude, train for aptitude. The right mindset is harder to teach than the right skills.**

What it means in practice: Recruitment evaluates curiosity, adaptability, and collaborative disposition alongside technical skills. The organization invests in training and development to build aptitude. Team composition balances different attitudes -- pioneers (explorers), settlers (developers), and town planners (operators).

**Anti-pattern:** Hiring exclusively for current technical skills with no consideration of adaptability. No training budget or development programs. Expecting people to self-teach everything. Uniform team composition where everyone thinks the same way.

**Detection signal:** Ask about hiring criteria and training investment. If hiring focuses exclusively on current skill match with no evaluation of learning ability or collaborative attitude, this principle is weak. If training is minimal or non-existent, aptitude development is absent.

---

#### Principle 20: Design for Constant Evolution

**Build systems that can change. Assume every component will evolve and design accordingly.**

What it means in practice: Architecture anticipates change by using modular boundaries, well-defined interfaces, and loose coupling. The organization understands that today's Genesis component is tomorrow's Commodity and designs so components can be replaced or evolved without rewriting the entire system. Lock-in to specific implementations is actively avoided.

**Anti-pattern:** Monolithic architectures where changing one component requires changing everything. Tight coupling to specific vendors or technologies with no abstraction layer. Designing as if the current state is permanent. No migration path for any component.

**Detection signal:** Ask what would happen if a key component needed to be replaced. If the answer involves "complete rewrite" or "that's impossible," design for evolution is absent. If components can be swapped through defined interfaces, it is present.

---

### Category 3: Operation

These principles govern how the organization runs, manages, and sustains its operations day to day. They determine resilience and efficiency.

---

#### Principle 21: Manage Inertia

**Recognize and actively counter organizational inertia. Past success is the most powerful source of resistance to change.**

What it means in practice: The organization explicitly identifies sources of inertia -- political capital invested in existing approaches, sunk cost reasoning, comfort with the familiar, supplier relationships. Leaders name inertia when they see it and create structured processes for overcoming it. Change initiatives account for inertia as a force to be managed.

**Anti-pattern:** Continuing with known-inferior approaches because of sunk costs. "We've invested too much to change now." Legacy systems maintained long past their useful life because change is uncomfortable. Executives defending their past decisions against evidence of needed change.

**Detection signal:** Ask about the oldest technology, process, or practice still in use and why it persists. If the answer is "it still works" without evidence it was re-evaluated, inertia is unmanaged. If there is a deliberate process for reviewing and retiring legacy approaches, inertia is being managed.

---

#### Principle 22: Optimise Flow (Operational)

**Smooth operations, reduce waste. In steady-state operations, efficiency and reliability are paramount.**

What it means in practice: Operational processes are mapped and measured. Waste -- unnecessary steps, redundant approvals, manual work that could be automated -- is systematically identified and eliminated. Operational metrics (throughput, error rates, lead times) are tracked and improved. This is distinct from development flow (Principle 18) in that it focuses on running systems, not building them.

**Anti-pattern:** Operational processes that have never been reviewed or measured. Manual steps in processes that could be automated. No operational metrics or metrics that are collected but never reviewed. Accepting inefficiency as "just how things are."

**Detection signal:** Ask for operational metrics and when they were last reviewed. If metrics do not exist, or if they exist but show no trend of improvement, operational flow is not optimized. If there is a regular cadence of operational review and improvement, it is being practiced.

---

#### Principle 23: Think Small (Components)

**Break systems into manageable, independently deployable pieces. Monoliths are the enemy of evolution.**

What it means in practice: Systems are decomposed into components with clear boundaries and interfaces. Each component can evolve, be replaced, or scale independently. Component boundaries align with evolutionary stages so that a Genesis-stage component can be managed differently from a Commodity-stage one.

**Anti-pattern:** Monolithic applications where all functionality is deployed as one unit. "Big bang" releases that change everything at once. Inability to update one part of the system without risking others. Components so tightly coupled that they must evolve in lockstep.

**Detection signal:** Ask whether any part of the system can be deployed independently. If the answer is "we deploy everything together," components are not small enough. If individual services or modules have their own release cycles, this principle is present.

---

#### Principle 24: Distribute Power and Decision-Making

**Decisions should be made at the point of information. Push authority to the people closest to the problem.**

What it means in practice: Teams have the authority to make decisions about their components without escalating to leadership for routine choices. Decision rights are clearly defined -- teams know what they can decide and what requires escalation. Leadership provides context (purpose, constraints, strategy) rather than directives.

**Anti-pattern:** All decisions flowing up to a central authority regardless of significance. Teams that cannot deploy, purchase tools, or change processes without executive approval. Decision queues that create bottlenecks. Leaders making detailed technical decisions they lack context for.

**Detection signal:** Ask teams what decisions they can make autonomously. If the answer is "very few" or "we need approval for everything," power is centralized. If teams can make and execute decisions about their domain with leadership providing strategic context, distribution is present.

---

#### Principle 25: Provide Purpose, Mastery, and Autonomy

**Motivate through intrinsic factors. People do their best work when they understand why it matters, can grow their skills, and have freedom in how they work.**

What it means in practice: Every team understands how their work connects to the organization's purpose and user value. There are clear paths for skill development and mastery. Teams have autonomy in how they achieve their goals, even when the goals themselves are set by leadership. These three factors (from Daniel Pink's motivation framework) are actively cultivated.

**Anti-pattern:** Teams that cannot explain why their work matters. No growth paths or skill development opportunities. Micromanagement of how work is done rather than defining outcomes. Motivation through fear, competition, or purely financial incentives.

**Detection signal:** Ask team members why their work matters and how they are developing their skills. If answers are vague or cynical ("because I'm paid to"), purpose and mastery are absent. If people can articulate the connection between their work and user value, and if they are actively learning, these factors are present.

---

#### Principle 26: There is No One-Size-Fits-All

**Different evolution stages require different management approaches. What works for Genesis will fail for Commodity, and vice versa.**

What it means in practice: The organization recognizes that a Genesis-stage component needs exploration, tolerance for failure, and small teams -- while a Commodity-stage component needs efficiency, standardization, and automation. Management practices, metrics, and team structures vary by evolution stage. There is no single "right way" imposed across the board.

**Anti-pattern:** Applying identical KPIs to all teams regardless of what they are building. Demanding six-sigma quality from an experimental prototype. Running agile ceremonies for infrastructure automation. Uniform team structures regardless of component type.

**Detection signal:** Compare how different teams or projects are managed. If the approach is identical regardless of whether the work is novel or commodity, this principle is violated. If management approach visibly varies by the nature of the work, it is present.

---

#### Principle 27: Use Appropriate Methods (Operational)

**Match operational methods to the evolution stage of the component being operated. Six Sigma for Commodity, agile for Genesis.**

What it means in practice: Operational methods are selected based on the maturity and predictability of the component. Commodity components use standardized runbooks, automation, and efficiency metrics. Genesis-stage components use flexible, exploratory operational approaches. The operational method evolves as the component evolves.

**Anti-pattern:** Using the same operational process for a prototype API and a production database. Demanding runbooks for something that changes daily. Using ad-hoc operations for a stable commodity service. No connection between component maturity and operational approach.

**Detection signal:** Ask how operational methods are chosen. If the answer references the maturity or evolution stage of the component, this principle is being applied. If there is a single operational playbook for everything, it is not.

---

#### Principle 28: A Bias Towards Action

**Experiment rather than plan endlessly. When uncertain, run a small experiment rather than commissioning a large study.**

What it means in practice: The organization defaults to trying things rather than analyzing them indefinitely. Small, reversible experiments are cheap and frequent. There is a low barrier to running experiments -- teams do not need multi-level approval to test a hypothesis. Plans are short and lead to action quickly.

**Anti-pattern:** Months of analysis and planning before any execution. Requiring certainty before acting. "Let's do more research" as a permanent state. Perfect plans that are never executed. Committees that study but never decide.

**Detection signal:** Ask how quickly the organization can go from idea to experiment. If the answer is measured in months, action bias is low. If teams can test ideas within days, it is present. Count the number of experiments run in the last quarter -- zero is a red flag.

---

#### Principle 29: Move Fast

**Speed of adaptation is a competitive advantage. Reduce cycle times, remove gates, compress feedback loops.**

What it means in practice: The organization treats speed as a strategic asset. Deployment frequency is high. Feedback loops are short -- from idea to user feedback in days, not months. Decision cycles are fast. The organization can respond to landscape changes quickly rather than being locked into long planning cycles.

**Anti-pattern:** Quarterly release cycles for software that could ship daily. Month-long decision processes for reversible choices. Slow feedback loops where user reactions take weeks to reach teams. Confusing "moving fast" with "being reckless" -- speed with safety nets is the goal.

**Detection signal:** Measure deployment frequency, lead time for changes, and time from user feedback to team action. If any of these are measured in months, the organization is not moving fast. If they are measured in days or hours, speed is present.

---

#### Principle 30: Be the Best

**If you are going to do something, be excellent at it. Mediocrity in execution is worse than not doing it at all.**

What it means in practice: The organization identifies the components where it must be best-in-class and focuses effort there. For components that are not differentiating, it uses commodity or outsourced solutions rather than maintaining mediocre internal versions. Excellence is concentrated where it matters most.

**Anti-pattern:** Mediocre internal tools for every function rather than best-in-class for core and commodity for the rest. "Good enough" applied to differentiating capabilities. Spreading effort so thin that nothing is excellent. Internal pride preventing adoption of superior external solutions.

**Detection signal:** Ask the organization what it is best at. If the answer is vague or "everything," focus is lacking. If it can name specific capabilities where it invests disproportionately for excellence, and uses external solutions for the rest, this principle is present.

---

### Category 4: Learning

These principles govern how the organization acquires, processes, and applies new knowledge. They determine adaptability and long-term survival.

---

#### Principle 31: Use a Systematic Mechanism of Learning

**Have a deliberate process for capturing and sharing lessons. Learning that stays in one person's head is not organizational learning.**

What it means in practice: The organization has structured mechanisms for capturing lessons -- post-mortems, retrospectives, knowledge bases, learning reviews. Lessons are shared across teams, not siloed. There is a regular cadence of reflection and documentation. New team members can access institutional learning.

**Anti-pattern:** Knowledge existing only in individuals' heads. Repeating the same mistakes because lessons were never captured. Post-mortems conducted but results never shared or acted upon. No onboarding materials reflecting learned lessons.

**Detection signal:** Ask to see the knowledge base or lessons-learned repository. If it does not exist, or if it exists but has not been updated recently, systematic learning is absent. If teams regularly contribute and reference it, it is present.

---

#### Principle 32: A Bias Towards Data

**Make decisions based on evidence, not opinion. When opinions conflict, data resolves the dispute.**

What it means in practice: The organization collects relevant data and uses it to inform decisions. Dashboards and metrics are available and actually consulted. "I think" is accompanied by "and here's the data." When data is unavailable, the organization recognizes this as a risk and seeks to collect it rather than proceeding on opinion alone.

**Anti-pattern:** Decisions made by the loudest voice or highest-ranking person. No metrics or dashboards. Data collected but never analyzed. "We don't need data, I've been in this industry for 20 years." Cherry-picking data to support predetermined conclusions.

**Detection signal:** Ask how the last major decision was made. If the answer involves data and evidence, this principle is present. If it was primarily based on opinion, experience, or authority, it is weak. Check whether dashboards exist and are actively used.

---

#### Principle 33: Use a Systematic Mechanism of Challenge

**Regularly question your own assumptions, practices, and decisions. Build challenge into the operating rhythm.**

What it means in practice: The organization has structured processes for challenging its own thinking -- red teams, pre-mortems, devil's advocate roles, regular strategy reviews. These are not occasional events but embedded in the operating cadence. Challenge is welcomed and expected, not tolerated or resented.

**Anti-pattern:** Groupthink where dissent is uncomfortable or punished. Strategy set once per year and never revisited. No mechanism for surfacing "what if we're wrong?" No pre-mortems before major initiatives. Challenge only happening during crises.

**Detection signal:** Ask about the last time a major decision or strategy was formally challenged. If teams cannot recall such an event, or if it only happens during failures, systematic challenge is absent. If regular reviews include explicit challenge exercises, it is present.

---

#### Principle 34: Exploit the Landscape

**Use situational awareness to inform decisions. Maps reveal opportunities invisible to those navigating without them.**

What it means in practice: The organization uses Wardley Maps or equivalent situational awareness tools to understand its landscape before making strategic decisions. Decisions are informed by understanding where components are in their evolution, what is changing, and where opportunities exist. Strategy is grounded in landscape, not in hope.

**Anti-pattern:** Strategy created without understanding the current landscape. No maps, no situational awareness. Decisions based on frameworks (SWOT, Porter's Five Forces) that lack spatial and evolutionary context. Copying competitor strategies without understanding the underlying landscape.

**Detection signal:** Ask to see the organization's maps or equivalent landscape analysis. If none exist, situational awareness is absent. If maps exist but are outdated or not connected to decisions, they are decorative. If maps actively inform strategy, this principle is practiced.

---

#### Principle 35: Strategy is Iterative, Not Linear

**Revisit and revise strategy continuously. The landscape changes -- your strategy must change with it.**

What it means in practice: Strategy is treated as a living document, revised as the landscape evolves. There is a regular cadence of strategy review (quarterly or more frequent). New information from the ecosystem triggers strategy reassessment. The organization does not wait for an annual planning cycle to adapt.

**Anti-pattern:** Annual strategic plans that are locked in for 12 months regardless of landscape changes. "We already decided our strategy" used to shut down discussion of new information. Strategy documents that gather dust between planning cycles. No connection between operational learning and strategic adjustment.

**Detection signal:** Ask when the strategy was last revised and what triggered the revision. If revision only happens annually, iteration is weak. If strategy is revisited at least quarterly and responds to landscape changes, it is iterative.

---

#### Principle 36: There is No Single Culture

**Different evolution stages need different cultures. Pioneers, settlers, and town planners are all necessary -- and fundamentally different.**

What it means in practice: The organization recognizes and cultivates three distinct cultural attitudes. Pioneers (Genesis workers) thrive in chaos, ambiguity, and exploration. Settlers (Custom-Built to Product workers) take pioneer discoveries and make them useful and scalable. Town Planners (Commodity workers) industrialize and optimize for efficiency. All three are valued equally and managed differently.

**Anti-pattern:** Expecting all employees to be "innovative" (pioneer culture imposed on town planners). Penalizing town planners for lack of creativity or pioneers for lack of efficiency. A single culture imposed across the organization. Only valuing one type while neglecting the others.

**Detection signal:** Ask how the organization values and manages its operational/infrastructure teams versus its innovation teams. If they are managed identically, or if one is clearly second-class, this principle is violated. If different cultures are explicitly recognized and supported, it is present.

---

#### Principle 37: Seek the Best

**Actively look for better approaches, technologies, and practices. Complacency is the enemy of excellence.**

What it means in practice: The organization has a deliberate process for scanning the landscape for improvements -- technology radar, conference attendance, vendor evaluations, competitive analysis. There is a regular cadence of evaluation and comparison against external benchmarks. Internal practices are compared to industry best practices.

**Anti-pattern:** No external benchmarking. Assuming internal approaches are best without comparison. No technology radar or equivalent scanning mechanism. "What we have works" without checking if something works better. Ignoring developments in adjacent industries.

**Detection signal:** Ask about the organization's mechanism for discovering better approaches. If there is no technology radar, no external benchmarking, and no regular evaluation process, seeking the best is absent. If teams regularly evaluate alternatives and adopt improvements, it is present.

---

#### Principle 38: A Bias Towards Action (Learning)

**Learn by doing, not just planning. The fastest way to learn is to try, fail, reflect, and try again.**

What it means in practice: When the organization needs to learn something new, it runs experiments rather than only conducting research. Learning is active, not passive. Prototypes, proofs of concept, and pilots are the primary learning vehicles. The build-measure-learn cycle is the core learning mechanism.

**Anti-pattern:** Endless feasibility studies that never lead to action. Learning confined to reading reports and attending conferences with no application. "We need to learn more before we can try" as a permanent state. Training programs that teach theory without practice.

**Detection signal:** Ask how the organization learned its most recent significant lesson. If the answer involves an experiment or pilot, action-based learning is present. If it was purely theoretical or research-based, it is weak. Count active experiments -- zero means this principle is absent.

---

#### Principle 39: Listen to Your Ecosystems (Learning)

**Ecosystem signals contain competitive intelligence. Users, partners, and even competitors are teaching you -- if you are paying attention.**

What it means in practice: The organization treats ecosystem signals as a learning resource. Customer complaints reveal unmet needs. Partner frustrations reveal integration failures. Competitor moves reveal landscape changes. Open-source communities reveal emerging practices. All of these signals are captured, analyzed, and used to improve.

**Anti-pattern:** Treating customer complaints as noise rather than signal. Ignoring partner feedback. Not tracking competitor evolution. Dismissing open-source developments as irrelevant. No systematic mechanism for turning ecosystem signals into organizational learning.

**Detection signal:** Ask how ecosystem signals inform learning and improvement. If there is a systematic process -- feedback loops, competitive analysis reviews, community monitoring -- this is present. If ecosystem signals are ad hoc or ignored, it is absent.

---

#### Principle 40: A Bias Towards the New (Learning)

**New entrants and new ideas may contain the next evolution. Pay attention to what is emerging, not just what is established.**

What it means in practice: The organization monitors emerging technologies, new market entrants, and novel approaches as potential signals of the next evolution wave. New ideas are evaluated for disruptive potential, not just dismissed because they are small or unproven. There is a structured process for assessing whether new developments could shift the landscape.

**Anti-pattern:** Dismissing startups as irrelevant because they are small. Ignoring new technologies because they are not yet mature. Only paying attention to established players and known approaches. Assuming the current landscape is permanent.

**Detection signal:** Ask what emerging technologies or new entrants the organization is tracking. If the answer is "none" or if there is no process for monitoring the horizon, this principle is absent. If there is a technology radar or equivalent that includes emerging items, it is present.

---

## 3. Doctrine Scoring Rubric

For each of the 40 principles, assign a score from 0 to 4 based on the available evidence.

| Score | Level | Definition | Evidence Required |
|-------|-------|------------|-------------------|
| 0 | Not practiced | No evidence of this principle being applied. The organization is unaware of or actively contradicts the principle. | No artifacts, no behaviors, no stated intent. |
| 1 | Aware but inconsistent | Some individuals or teams practice the principle, but it is not systematic or organization-wide. | Isolated examples exist. Some team members could describe it. Not policy or practice. |
| 2 | Practiced but not measured | The principle is consistently applied across the organization, but there are no metrics tracking its effectiveness. | Observable behaviors and practices. No dashboards or KPIs tied to it. |
| 3 | Measured and improving | The principle is tracked with metrics and the organization is actively working to improve its application. | Metrics exist. Trends show improvement. Active initiatives to strengthen it. |
| 4 | Embedded in culture | The principle is automatic -- part of organizational DNA. New hires absorb it through osmosis. It would feel wrong to violate it. | Deeply ingrained. Violations are noticed and corrected organically. No enforcement needed. |

**Scoring guidance for agents:** When evidence is ambiguous, score conservatively (lower). A score of 2 is a reasonable default when a principle is clearly practiced but you have no data on measurement. Do not score above 2 without explicit evidence of metrics or cultural embedding.

---

## 4. Aggregate Scoring

### Calculation

- **Per-principle score:** 0-4 (as defined in the rubric above)
- **Category total:** Sum of 10 principle scores within the category (0-40)
- **Overall total:** Sum of all 40 principle scores (0-160)
- **Category average:** Category total divided by 10

### Interpretation Bands

| Range | Level | Interpretation |
|-------|-------|---------------|
| 0-40 | Critical | Basic organizational dysfunction. Multiple foundational principles are absent. The organization will struggle to execute any strategy reliably. Immediate intervention required on the lowest-scoring principles. |
| 41-80 | Developing | Aware of principles but inconsistent application. Some areas are strong while others are neglected. The organization can execute simple strategies but will struggle with complex or fast-moving environments. Focus on the weakest category first. |
| 81-120 | Competent | Solid foundations with room for improvement. Most principles are practiced; some are measured. The organization can execute most strategies effectively. Target the lowest-scoring principles within each category for the highest leverage improvement. |
| 121-160 | Exemplary | Strong organizational health across all categories. Principles are embedded in culture and measured for continuous improvement. The organization is well-positioned to execute complex strategies and adapt to landscape changes. Focus shifts from building doctrine to maintaining it under growth and change. |

### Category Imbalance

Pay attention to variance between category scores. A category average below 2.0 while others are above 3.0 indicates a critical imbalance. The weakest category will constrain overall strategic capability regardless of strength in other areas.

**Priority rule:** When resources are limited, improve the weakest category first. An organization strong in Communication but weak in Learning will make good plans it never learns from. An organization strong in Learning but weak in Operation will learn what to do but fail to execute.

---

## 5. Doctrine Assessment Protocol

The wardley-doctrine agent should follow this sequence when conducting a doctrine assessment.

### Step 1: Gather Context

Collect a description of the organization, team, or product being assessed. This may come from:
- Direct description provided by the user
- A Wardley Map with annotations
- Documentation, strategy artifacts, or process descriptions
- Interview responses or survey data

The richer the input, the more accurate the assessment. Acknowledge gaps in input explicitly.

### Step 2: Score Each Principle

For each of the 40 principles:
1. Identify evidence from the context that relates to this principle
2. Determine whether the principle is practiced, measured, or embedded
3. Assign a score (0-4) using the rubric
4. Record the key evidence or absence of evidence supporting the score

Score conservatively. If the context does not mention a principle at all, score 0 or 1 depending on whether the absence is likely an omission or a genuine gap.

### Step 3: Calculate Totals

- Sum scores for each of the four categories (Communication, Development, Operation, Learning)
- Calculate the overall total
- Identify the highest and lowest scoring categories

### Step 4: Identify the Weakest Category

The category with the lowest total score is the primary constraint on organizational effectiveness. This is where improvement effort should focus first.

### Step 5: Identify Top 5 Doctrine Violations

From all 40 principles, find the five with the lowest scores that also have the highest practical impact. A violation is "high impact" when:
- It directly causes visible organizational dysfunction
- It blocks multiple other principles from being effective
- It relates to the organization's current strategic challenges

Rank these five by urgency (most impactful first).

### Step 6: Recommend Prioritized Improvements

For each of the top 5 violations, provide:
- **What to do:** A concrete first step (not a vague aspiration)
- **Expected impact:** What improvement looks like in 30-90 days
- **Dependencies:** Which other principles must improve alongside it
- **Warning sign:** How to detect if the improvement is not taking hold

### Step 7: Produce the Assessment Report

Structure the output as:
1. Overall score and interpretation band
2. Category scores with brief commentary
3. Top 5 violations with recommendations
4. Principle-by-principle score table (all 40)
5. Suggested reassessment timeline

---

## 6. Doctrine and Evolution Stage Alignment

Not all doctrine principles are equally critical at all evolution stages. While all 40 should be practiced, some matter disproportionately at specific stages. The agent should weight its recommendations based on what the organization is currently building and operating.

### Genesis Stage (Novel, Experimental)

**Critical principles:**

| # | Principle | Why It Matters at Genesis |
|---|-----------|--------------------------|
| 15 | Manage failure | Failure is the primary learning mechanism. Punishing it kills exploration. |
| 8 | Be humble | Nobody knows the right answer yet. Certainty is dangerous. |
| 9 | A bias towards the new | The entire point is creating something new. Clinging to the old defeats the purpose. |
| 28 | A bias towards action | Speed of learning matters more than quality of plan. Experiment fast. |
| 13 | Think FIRE | Resources are scarce and uncertainty is high. Simplicity maximizes learning per dollar. |

**Lower priority at Genesis:** Principles about standards, efficiency, and measurement (17, 22, 30) are less critical because there is nothing stable enough to standardize or optimize yet.

### Custom-Built Stage (Emerging, Bespoke)

**Critical principles:**

| # | Principle | Why It Matters at Custom-Built |
|---|-----------|-------------------------------|
| 7 | Use appropriate methods | The transition from exploration to deliberate building requires matching methods to emerging certainty. |
| 18 | Optimise flow | As the solution takes shape, delivery flow becomes a bottleneck. Remove handoffs. |
| 13 | Think FIRE | Scope creep is the primary risk. Restrained, elegant solutions survive to Product stage. |
| 20 | Design for constant evolution | What you build now must evolve further. Tight coupling at this stage creates legacy debt. |
| 12 | Focus on user needs (not yours) | As the builder gains confidence, the temptation to build for themselves rather than the user increases. |

**Lower priority at Custom-Built:** Principles about commodity management (17, 26, 27) are premature. Principles about ecosystem listening (10, 39) are secondary to building focus.

### Product Stage (Standardizing, Competing)

**Critical principles:**

| # | Principle | Why It Matters at Product |
|---|-----------|--------------------------|
| 17 | Use standards | Adopting standards reduces cost and increases interoperability as the market matures. |
| 11 | Know your users | Competition means differentiation, which requires deep user understanding. |
| 16 | Be pragmatic | Feature completeness and shipping cadence matter more than architectural perfection. |
| 29 | Move fast | In a competitive market, speed of feature delivery is a competitive advantage. |
| 5 | Use a common language | Scaling teams to compete requires shared understanding across functions. |

**Lower priority at Product:** Principles about failure tolerance (15), humility (8), and exploration (9) are less critical -- the product is past the experimental phase.

### Commodity Stage (Standardized, Utility)

**Critical principles:**

| # | Principle | Why It Matters at Commodity |
|---|-----------|----------------------------|
| 22 | Optimise flow (operational) | Efficiency is the primary competitive dimension. Every wasted step is a cost disadvantage. |
| 29 | Move fast | Speed of operational response (not feature development) determines reliability and cost. |
| 26 | There is no one-size-fits-all | Managing commodity differently from other stages prevents over-engineering or under-investing. |
| 30 | Be the best | If you operate a commodity, operational excellence is the only differentiator. |
| 23 | Think small (components) | At scale, modularity enables independent optimization and replacement. |

**Lower priority at Commodity:** Principles about novelty (9, 40), experimentation (28), and failure tolerance (15) are less relevant -- the component should be stable and predictable.

### Using Stage Alignment in Assessments

When scoring doctrine, the agent should:

1. Identify which evolution stages the organization primarily operates at
2. Weight the critical principles for those stages more heavily in the "Top 5 Violations" analysis
3. Note when an organization scores well on principles irrelevant to its current stage but poorly on critical ones
4. Recommend that improvements focus on stage-critical principles first

A commodity-focused organization scoring 4 on "Manage failure" but 1 on "Optimise flow (operational)" has its priorities inverted. The assessment should surface this misalignment explicitly.