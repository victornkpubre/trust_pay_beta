# TrustPay

**AI-augmented peer-to-peer escrow payments.** TrustPay holds money in escrow for money pools, secure sales, group goals and bill splits. It releases funds only when each party's obligations are met, and a mediator handles disputes. A conversational AI assistant answers account questions and sets up transactions through chat.

This repository is the **Flutter mobile app**. TrustPay is a polyglot system made up of four repositories:

| Repository | Role | Stack |
|---|---|---|
| **[trust_pay_beta](https://github.com/victornkpubre/trust_pay_beta)** (this repo) | Mobile client | Flutter, BLoC, Freezed, Dio, Clean Architecture |
| [trust_pay_ai](https://github.com/victornkpubre/trust_pay_ai) | AI support assistant and real-time group chat | Python, FastAPI, LangGraph, LangChain, SSE, WebSockets, Kafka consumer |
| [trust_pay_mcp](https://github.com/victornkpubre/trust_pay_mcp) | Model Context Protocol server exposing user-scoped tools to the agent | Python, MCP SDK (Streamable HTTP) |
| [trust_pay_api](https://github.com/victornkpubre/trust_pay_api) | Core payments API: escrow, obligations, mediation, wallets, bills | PHP, Laravel, Sanctum, Kafka producer, Stripe, Paystack |

> `trust_pay_ai`, `trust_pay_mcp` and `trust_pay_api` are currently private. Access is available on request.

## Demo

- 📹 Demo video: `[PLACEHOLDER — link to demo video]`
- 📱 Download / test build: `[PLACEHOLDER — Play Store / TestFlight / APK link]`
- 📖 API docs: `[PLACEHOLDER — https://trust-pay-api.onrender.com/docs]`

<!-- Screenshots: replace with real images -->
| Home | AI assistant | Transaction draft | Proof upload |
|---|---|---|---|
| `[PLACEHOLDER]` | `[PLACEHOLDER]` | `[PLACEHOLDER]` | `[PLACEHOLDER]` |

## Architecture

```
 Flutter app (trust_pay_beta)
   │  REST (Sanctum token)           │  SSE /chat · WebSocket group chat
   ▼                                 ▼
 trust_pay_api (Laravel) ◄──REST── trust_pay_mcp (MCP server) ◄──MCP── trust_pay_ai (FastAPI + LangGraph)
   │                                                                     ▲
   └──────────── Kafka: transactions · obligations · mediations ─────────┘
```

- **The app** calls `trust_pay_api` for all payment operations. It streams AI replies from `trust_pay_ai` over Server-Sent Events.
- **The AI agent** is a LangGraph ReAct loop. It reads the user's data only through `trust_pay_mcp`, which forwards the user's own token. The agent never touches the database directly.
- **Kafka events** from the API give the agent recent-activity context and trigger proactive push notifications.

## AI features

- **Conversational support:** ask about balances, transactions, obligations and disputes in plain language. Answers come from the user's real account data.
- **Chat-to-transaction (human in the loop):** the agent gathers the details and proposes a validated draft. It checks that members are real users, that dates are valid and that amounts add up. The app shows the draft as a confirmation card, and only the user's tap creates the transaction.
- **Bill-split agent workflow:** the agent finds a Nigerian biller (electricity, cable TV, airtime), verifies the customer number and drafts the split.
- **Guardrails:**
  - prompt-injection defences
  - server-side identity resolution, so the model never supplies user IDs
  - per-user rate limiting
  - cleaned error messages

## App features

- Four transaction types: money pools, secure sales, group goals and bill splits
- NGN and GBP wallets, funded with Paystack and Stripe
- GPS-stamped photo and video proof for deliveries and attendance
- Mediation for disputes
- Real-time notifications (Pusher Channels / Beams, Firebase Cloud Messaging)
- Google sign-in (see [docs/google_sign_in_setup.md](docs/google_sign_in_setup.md))

## Project structure

Clean Architecture under `lib/main/`:

```
lib/main/
├── app/           # DI, routing, app setup
├── data/          # remote/local data sources, mappers, repository implementations
├── domain/        # entities (Freezed), repository contracts
└── presentation/  # BLoCs and views
```

## Getting started

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

Backend URLs and keys are configured in `[PLACEHOLDER — config file / --dart-define names]`.

## Author

**Victor Edet**: [GitHub](https://github.com/victornkpubre) · [Portfolio]([PLACEHOLDER]) · [LinkedIn]([PLACEHOLDER])
