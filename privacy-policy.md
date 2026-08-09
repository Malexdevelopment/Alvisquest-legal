# Privacy Policy

**AlvisQuest**
Effective date: 27 June 2026
Last updated: 29 July 2026

---

## 1. Who we are

AlvisQuest is operated by **Malex Development**, a company registered under German law at **Bodenseestraße 19, 81241 München, Germany** ("we", "us", "our").

For the purpose of EU data protection law, we are the **data controller** of the personal data described in this policy.

Contact for privacy matters: **hello@alvisquest.com**

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

Everything you create inside AlvisQuest is stored on our servers:
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

### 2.4 Subscription, purchase, and token data

We record your subscription tier, purchased add-ons, token balance, purchase product identifier, transaction identifier, and verification result. Payments are processed by Apple (App Store), Google (Google Play), or Mollie on our website. We never receive or store your full payment card details.

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

### 2.6 Community safety data

If you publish or interact with public decks, we process:
- The public deck content and publisher account ID
- Reports you submit, including the selected reason and optional details
- Account IDs you choose to block
- Moderation status and resolution timestamps

**Why:** To filter, investigate, and remove content that violates our Terms or Community Guidelines, and to keep blocked publishers out of your public-deck results.
**Legal basis (GDPR):** Legitimate interests (Art. 6(1)(f)) in preventing abuse and keeping the service safe.

### 2.7 Data we do NOT collect

- Location / GPS
- Device contacts
- Health or biometric data
- Browsing history outside the app
- Advertising identifiers

---

## 3. AI processing — how your content is used

Several optional features send the content needed for a request to third-party AI providers. Depending on the feature, this may include card text, notes, prompts, documents, images, or audio. The app shows an AI data-sharing choice before any of this content is sent.

AI and translation features remain off unless you choose **Allow AI features**. If you choose **Not now**, non-AI features continue to work. You can withdraw permission at any time under **Help & Legal → AI data sharing**. Withdrawal prevents future AI and translation requests; it does not undo processing that was completed at your request before withdrawal.

Features and the provider used:

| Feature | Provider |
|---|---|
| Card generation, Chat RAG | Mistral AI (EU) or Anthropic (US) depending on your tier |
| Explain card, Grade answer, Smart hint | Mistral AI (EU) |
| Fact check | Anthropic (US) — Pro and Scholar only |
| Image generation | Black Forest Labs — Pro and Scholar only |
| Lecture transcription | Mistral Voxtral (EU), Deepgram high-accuracy option, or Groq fallback |
| Image understanding / OCR | Mistral AI |
| Translation | DeepL (EU) |
| Semantic duplicate detection | Mistral AI |

We contractually restrict processors to providing the requested service. We do not use your content to train our own AI models or sell it for advertising. Providers may retain limited request or security logs under their own enterprise terms and legal obligations; their current policies are linked below.

---

## 4. Calendar and Reminders access

If you grant calendar or reminders permission, AlvisQuest creates and updates study reminder events on your device. This data:
- Is written directly to Apple Calendar / Reminders on your device
- Is **not** transmitted to our servers
- Remains fully under your control and can be deleted through your device's Calendar or Reminders app

---

## 5. Sub-processors

We share data with the following processors, each bound by a Data Processing Agreement (DPA):

| Processor | Role | Location | Privacy policy |
|---|---|---|---|
| **Supabase, Inc.** | Database, authentication, file storage, edge functions | EU (eu-central-2) | [supabase.com/privacy](https://supabase.com/privacy) |
| **Mistral AI SAS** | AI inference (card generation, explanations, grading, embeddings, OCR, transcription) | France (EU) | [mistral.ai/privacy](https://mistral.ai/terms/#privacy-policy) |
| **Anthropic, PBC** | AI inference (card generation, fact check, chat) | USA | [anthropic.com/privacy](https://www.anthropic.com/legal/privacy) |
| **Black Forest Labs GmbH** | Image generation | EU / USA processing infrastructure | [blackforestlabs.ai/privacy](https://blackforestlabs.ai/privacy-policy/) |
| **Deepgram, Inc.** | Optional high-accuracy audio transcription | USA | [deepgram.com/privacy](https://deepgram.com/privacy) |
| **Groq, Inc.** | Lecture transcription fallback | USA | [groq.com/privacy](https://groq.com/privacy-policy/) |
| **DeepL SE** | Translation | Germany (EU) | [deepl.com/privacy](https://www.deepl.com/privacy) |
| **Google LLC** | Sign-in authentication | USA | [policies.google.com/privacy](https://policies.google.com/privacy) |
| **Apple Inc.** | Sign-in authentication and App Store payment | USA | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| **Mollie B.V.** | Website payment processing | Netherlands (EU) | [mollie.com/privacy](https://www.mollie.com/privacy) |

We do not sell, rent, or share your personal data with any third party for marketing or advertising purposes.

We require every processor that receives user data to provide the same or an equal level of protection described in this policy and required by applicable law and the Apple App Review Guidelines. This is addressed through data-processing agreements, confidentiality and security obligations, purpose limitations, and appropriate transfer safeguards.

---

## 6. International data transfers

Our primary infrastructure (Supabase) is hosted in the EU. Mistral AI and DeepL are EU-based. Some optional requests may be processed in the United States by Anthropic, Black Forest Labs infrastructure, Deepgram, Groq, Google, or Apple.

For transfers to providers outside the EEA, we rely on an applicable adequacy decision, the EU-US Data Privacy Framework where available, or **Standard Contractual Clauses (SCCs)** approved by the European Commission under Art. 46(2)(c) GDPR, together with supplementary safeguards where required.

---

## 7. Data retention

| Data type | Retention |
|---|---|
| Account data and user content | Retained for the duration of your account, plus 30 days after deletion to allow recovery |
| Study session history | Retained for the duration of your account |
| Audio recordings | Retained until you delete the associated card or your account |
| Uploaded images | Retained until you delete the associated card or your account |
| Infrastructure logs | 30 days |
| Public deck reports and moderation records | Up to 24 months after resolution, unless longer retention is needed for security or legal claims |
| Blocked-account choices | Until you unblock the account or delete your account |
| AI consent choice | Until you change the choice, delete the app data, or delete your account |

When you delete your account (via Profile Settings → Delete Account), account data and user content are permanently deleted within 30 days, except records we must retain temporarily for fraud prevention, security, charge disputes, or legal claims. Anonymised aggregate statistics are not deleted because they cannot be linked back to you.

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

To exercise any right, email **hello@alvisquest.com**. We will respond within **30 days**. We may need to verify your identity before fulfilling a request.

You also have the right to lodge a complaint with your national data protection authority. As a German-based controller, our lead supervisory authority is the [Bayerisches Landesamt für Datenschutzaufsicht (BayLDA)](https://www.lda.bayern.de). The full list of EU authorities is at [edpb.europa.eu](https://www.edpb.europa.eu/about-edpb/about-edpb/members_en).

---

## 9. Your rights under CCPA (California users)

If you are a California resident, you have the right to:

- **Know** what personal information we collect, use, disclose, or sell
- **Delete** personal information we hold about you (subject to certain exceptions)
- **Opt out of the sale of your personal information** — we do not sell personal information, so this right does not currently apply
- **Non-discrimination** — we will not discriminate against you for exercising any of these rights

**Categories of personal information collected** (CCPA categories):

| CCPA category | Examples in AlvisQuest |
|---|---|
| Identifiers | Email address, account ID |
| Commercial information | Subscription tier |
| Internet/electronic activity | Study session logs, feature usage |
| Audio / electronic data | Voice recordings for flashcard answers, uploaded audio for transcription |
| Inferences | SRS performance metrics derived from session data |

We do not sell personal information. We do not share personal information with third parties for cross-context behavioural advertising.

To submit a CCPA request, email **hello@alvisquest.com** with the subject line "CCPA Request". We will respond within **45 days**, extendable by a further 45 days with notice.

---

## 10. Children

AlvisQuest is not directed at children under 13 (or under 16 in the EU where parental consent would otherwise be required). We do not knowingly collect personal data from children below the applicable age. Public decks are subject to content filtering, reporting, blocking, and moderation. If you believe we have inadvertently collected a child's data, please contact us and we will delete it promptly.

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
Email: hello@alvisquest.com

For EU/UK users: if you have unresolved concerns, you may contact your local supervisory authority (see section 8).
