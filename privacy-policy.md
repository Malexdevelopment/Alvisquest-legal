# Privacy Policy

**Flashme**
Effective date: 27 June 2026
Last updated: 27 June 2026

---

## 1. Who we are

Flashme is operated by **Malex Development**, a company registered under German law at **Bodenseestraße 19, 81241 München, Germany** ("we", "us", "our").

For the purpose of EU data protection law, we are the **data controller** of the personal data described in this policy.

Contact for privacy matters: **alexandre@flashme.co**

---

## 2. What data we collect and why

### 2.1 Account data

When you sign in with Google or Apple we receive:
- Your email address
- Your display name
- Your profile photo URL (Google only)

**Why:** To identify your account and personalise the app.
**Legal basis (GDPR):** Contract (Art. 6(1)(b)) — account data is necessary to provide the service.

### 2.2 User-generated content

Everything you create inside Flashme is stored on our servers:
- Flashcard sets and individual cards (text, images, metadata)
- AI-generated content associated with your cards (explanations, hints, grades, fact-check notes)
- Audio recordings you make when answering cards by voice
- Images you attach to cards (uploaded from your photo library or imported documents)
- Lecture audio files you upload for transcription (Pro+ only)

**Why:** To provide the core service — your content must be stored to sync across your devices and persist between sessions.
**Legal basis (GDPR):** Contract (Art. 6(1)(b)).

### 2.3 Study session data

We store records of your study activity:
- Which cards you reviewed and when
- Your self-rated performance (SRS ratings: Perfect / Average / Bad)
- Session statistics (correct rate, duration, card count)

**Why:** To power spaced repetition scheduling and generate session insights.
**Legal basis (GDPR):** Contract (Art. 6(1)(b)).

### 2.4 Subscription and tier data

We record your subscription tier (Standard / Pro / Pro-Latin / Scholar). Payment is processed exclusively by Apple (App Store) or Google (Google Play) — we never see or store your payment card details.

**Why:** To gate features to the correct tier.
**Legal basis (GDPR):** Contract (Art. 6(1)(b)).

### 2.5 Technical and log data

Our infrastructure (Supabase) automatically records:
- IP addresses at the time of requests
- Request timestamps and response codes
- Device platform (iOS / macOS / web / Android)

**Why:** For security, abuse prevention, and debugging.
**Legal basis (GDPR):** Legitimate interests (Art. 6(1)(f)) — detecting and preventing misuse of the service.
**Retention:** Logs are retained for 30 days and then deleted.

### 2.6 Data we do NOT collect

- Location / GPS
- Device contacts
- Health or biometric data
- Browsing history outside the app
- Advertising identifiers

---

## 3. AI processing — how your content is used

Several features send your card content or audio to third-party AI providers to generate a response. This is described in the sub-processor table in section 5.

**We do not use your data to train any AI model.** Each request is stateless — content is sent to the provider, a response is returned, and nothing is retained by the provider beyond their standard operational log retention (see their individual privacy policies).

Features and the provider used:

| Feature | Provider |
|---|---|
| Card generation, Chat RAG | Mistral AI (EU) or Anthropic (US) depending on your tier |
| Explain card, Grade answer, Smart hint | Mistral AI (EU) |
| Fact check | Anthropic (US) — Pro and Scholar only |
| Image generation | Black Forest Labs (EU) — Pro and Scholar only |
| Lecture transcription | Gladia (EU) with Groq (US) as fallback — Pro+ only |
| Image understanding / OCR | Mistral AI (EU) or Anthropic (US) depending on tier |

For tiers that route to US providers (primarily Scholar tier's Fact Check and Card Generation), see section 6 on international transfers.

---

## 4. Calendar and Reminders access

If you grant calendar or reminders permission, Flashme creates and updates study reminder events on your device. This data:
- Is written directly to Apple Calendar / Reminders on your device
- Is **not** transmitted to our servers
- Remains fully under your control and can be deleted through your device's Calendar or Reminders app

---

## 5. Sub-processors

We share data with the following processors, each bound by a Data Processing Agreement (DPA):

| Processor | Role | Location | Privacy policy |
|---|---|---|---|
| **Supabase, Inc.** | Database, authentication, file storage, edge functions | EU (eu-west-1 / eu-central-1) | supabase.com/privacy |
| **Mistral AI SAS** | AI inference (card generation, explanations, grading, embeddings) | France (EU) | mistral.ai/privacy |
| **Anthropic, PBC** | AI inference (card generation, fact check, chat — Scholar tier) | USA | anthropic.com/privacy |
| **Black Forest Labs GmbH** | Image generation | Germany (EU) | blackforestlabs.ai/privacy |
| **Gladia SAS** | Lecture audio transcription | France (EU) | gladia.io/privacy |
| **Groq, Inc.** | Lecture transcription fallback (Whisper) | USA | groq.com/privacy |
| **Google LLC** | Sign-in authentication | USA | policies.google.com/privacy |
| **Apple Inc.** | Sign-in authentication, App Store payment | USA | apple.com/legal/privacy |

We do not sell, rent, or share your personal data with any third party for marketing or advertising purposes.

---

## 6. International data transfers

Our primary infrastructure (Supabase) is hosted in the EU. Most AI providers we use are also EU-based (Mistral AI, Black Forest Labs, Gladia).

For transfers to US-based providers (Anthropic, Groq, Google, Apple), we rely on **Standard Contractual Clauses (SCCs)** approved by the European Commission under Art. 46(2)(c) GDPR. Each of these providers has executed SCCs or operates under equivalent transfer mechanisms. Links to their transfer impact assessments are available from their respective privacy teams on request.

---

## 7. Data retention

| Data type | Retention |
|---|---|
| Account data and user content | Retained for the duration of your account, plus 30 days after deletion to allow recovery |
| Study session history | Retained for the duration of your account |
| Audio recordings | Retained until you delete the associated card or your account |
| Uploaded images | Retained until you delete the associated card or your account |
| Infrastructure logs | 30 days |

When you delete your account (via Profile Settings → Delete Account), all personal data listed above is permanently deleted within 30 days. Anonymised aggregate statistics (e.g. total cards created across all users) are not deleted, as they cannot be linked back to you.

---

## 8. Your rights under GDPR (EEA / UK users)

If you are in the European Economic Area or the United Kingdom, you have the following rights:

- **Right of access** — request a copy of the personal data we hold about you
- **Right to rectification** — ask us to correct inaccurate data
- **Right to erasure** — ask us to delete your personal data ("right to be forgotten")
- **Right to data portability** — receive your data in a machine-readable format (JSON export available in the app)
- **Right to restriction** — ask us to restrict processing while a complaint is resolved
- **Right to object** — object to processing based on legitimate interests (section 2.5)
- **Rights related to automated decision-making** — we do not make automated decisions with legal or similarly significant effects

To exercise any right, email **alexandre@flashme.co**. We will respond within **30 days**. We may need to verify your identity before fulfilling a request.

You also have the right to lodge a complaint with your national data protection authority. As a German-based controller, our lead supervisory authority is the [Bayerisches Landesamt für Datenschutzaufsicht (BayLDA)](https://www.lda.bayern.de). The full list of EU authorities is at [edpb.europa.eu](https://www.edpb.europa.eu/about-edpb/about-edpb/members_en).

---

## 9. Your rights under CCPA (California users)

If you are a California resident, you have the right to:

- **Know** what personal information we collect, use, disclose, or sell
- **Delete** personal information we hold about you (subject to certain exceptions)
- **Opt out of the sale of your personal information** — we do not sell personal information, so this right does not currently apply
- **Non-discrimination** — we will not discriminate against you for exercising any of these rights

**Categories of personal information collected** (CCPA categories):

| CCPA category | Examples in Flashme |
|---|---|
| Identifiers | Email address, account ID |
| Commercial information | Subscription tier |
| Internet/electronic activity | Study session logs, feature usage |
| Audio / electronic data | Voice recordings for flashcard answers, uploaded audio for transcription |
| Inferences | SRS performance metrics derived from session data |

We do not sell personal information. We do not share personal information with third parties for cross-context behavioural advertising.

To submit a CCPA request, email **alexandre@flashme.co** with the subject line "CCPA Request". We will respond within **45 days**, extendable by a further 45 days with notice.

---

## 10. Children

Flashme is not directed at children under 13 (or under 16 in the EU). We do not knowingly collect personal data from children. If you believe we have inadvertently collected data from a child, please contact us and we will delete it promptly.

---

## 11. Security

We protect your data using:
- TLS encryption for all data in transit
- Encryption at rest for all stored data (Supabase AES-256)
- Row-Level Security (RLS) policies on our database so each user can only access their own data
- JWT-authenticated API calls — no server-side plaintext access to user tokens

---

## 12. Changes to this policy

We will notify you of material changes by posting a notice in the app at least 14 days before the change takes effect. The "last updated" date at the top of this document will always reflect the most recent version. Continued use of the app after the effective date constitutes acceptance of the updated policy.

---

## 13. Contact

**Malex Development**
Bodenseestraße 19, 81241 München, Germany
Email: alexandre@flashme.co

For EU/UK users: if you have unresolved concerns, you may contact your local supervisory authority (see section 8).
