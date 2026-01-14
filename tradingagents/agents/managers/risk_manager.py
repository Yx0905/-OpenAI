import time
import json


def create_risk_manager(llm, memory):
    def risk_manager_node(state) -> dict:

        company_name = state["company_of_interest"]

        history = state["risk_debate_state"]["history"]
        risk_debate_state = state["risk_debate_state"]
        market_research_report = state["market_report"]
        news_report = state["news_report"]
        fundamentals_report = state["news_report"]
        sentiment_report = state["sentiment_report"]
        alpha_factors_report = state.get("alpha_factors_report", "")
        trader_plan = state["investment_plan"]

        curr_situation = f"{market_research_report}\n\n{sentiment_report}\n\n{news_report}\n\n{fundamentals_report}\n\n{alpha_factors_report}"
        past_memories = memory.get_memories(curr_situation, n_matches=2)

        past_memory_str = ""
        for i, rec in enumerate(past_memories, 1):
            past_memory_str += rec["recommendation"] + "\n\n"

        prompt = f"""As the Risk Management Judge and Debate Facilitator, your goal is to evaluate the debate between three risk analysts—Risky, Neutral, and Safe/Conservative—and determine the best course of action for the trader. 

CRITICAL: Your decision must result in a clear recommendation: Buy, Sell, or Hold. You MUST evaluate all three options EQUALLY. DO NOT default to Hold or Sell out of excessive caution.

**Decision Framework - Choose BUY when:**
- The Risky Analyst presents compelling evidence of growth opportunities, positive indicators, strong fundamentals, or favorable risk-reward ratios
- There are bullish technical signals, positive momentum, or strong market trends
- The evidence supports potential gains that justify the risk
- Even if there are some concerns, if the upside potential is significant, choose BUY

**Choose SELL when:**
- Risks significantly outweigh potential gains with clear negative signals
- There are fundamental weaknesses, declining trends, or major red flags
- The Safe/Conservative Analyst presents compelling evidence of serious risks

**Choose HOLD ONLY when:**
- The evidence is TRULY balanced with equal weight on both sides
- There is genuine uncertainty that cannot be resolved
- HOLD is a LAST RESORT, not a default option

**IMPORTANT BIAS CORRECTION:**
- If the Risky Analyst makes a strong BUY case with data and reasoning, you MUST seriously consider BUY
- Do NOT automatically choose HOLD just because the Safe/Conservative Analyst expresses caution
- Do NOT choose HOLD as a "safe middle ground" - that is a bias
- When in doubt between BUY and HOLD, choose BUY if there are any positive signals
- When in doubt between SELL and HOLD, choose SELL if there are clear negative signals
- HOLD should be RARE - only when truly uncertain

Guidelines for Decision-Making:
1. **Summarize Key Arguments**: Extract the strongest points from each analyst, focusing on relevance to the context.
2. **Provide Rationale**: Support your recommendation with direct quotes and counterarguments from the debate. If the Risky Analyst makes a compelling BUY case, explain why you are choosing BUY (or why you are not, if you choose otherwise).
3. **Refine the Trader's Plan**: Start with the trader's original plan, **{trader_plan}**, and adjust it based on the analysts' insights.
4. **Learn from Past Mistakes**: Use lessons from **{past_memory_str}** to address prior misjudgments and improve the decision you are making now to make sure you don't make a wrong BUY/SELL/HOLD call that loses money.

Deliverables:
- A clear and actionable recommendation: Buy, Sell, or Hold (with BUY being actively considered when appropriate).
- Detailed reasoning anchored in the debate and past reflections.
- Explicitly state why you chose your recommendation over the alternatives.

---

**Analysts Debate History:**  
{history}

---

Focus on actionable insights and continuous improvement. Build on past lessons, critically evaluate all perspectives, and ensure each decision advances better outcomes. REMEMBER: Do not default to HOLD - make a decisive choice based on the strongest evidence."""

        response = llm.invoke(prompt)

        new_risk_debate_state = {
            "judge_decision": response.content,
            "history": risk_debate_state["history"],
            "risky_history": risk_debate_state["risky_history"],
            "safe_history": risk_debate_state["safe_history"],
            "neutral_history": risk_debate_state["neutral_history"],
            "latest_speaker": "Judge",
            "current_risky_response": risk_debate_state["current_risky_response"],
            "current_safe_response": risk_debate_state["current_safe_response"],
            "current_neutral_response": risk_debate_state["current_neutral_response"],
            "count": risk_debate_state["count"],
        }

        return {
            "risk_debate_state": new_risk_debate_state,
            "final_trade_decision": response.content,
        }

    return risk_manager_node
