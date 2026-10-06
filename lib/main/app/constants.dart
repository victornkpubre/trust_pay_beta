class AppConstants {
  // Override for local testing, e.g.
  //   flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000
  static const String baseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: "https://trust-pay-api.onrender.com");
  static String token = "token";

  // trust_pay_ai (FastAPI): AI support assistant + group chat. Deployed on
  // Render (Stage 8 / ADR-0006) — see trust_pay_api/docs/stage8-render-deployment.md.
  // For local dev against a non-deployed trust_pay_ai, swap this for an
  // ngrok URL pointed at `uv run uvicorn main:app --reload` instead.
  static const String aiBaseUrl = String.fromEnvironment('AI_BASE_URL', defaultValue: "https://trust-pay-ai.onrender.com");

  // Same host as aiBaseUrl, ws(s):// scheme instead of http(s):// — Stage 6's
  // WebSocket group chat endpoint lives on trust_pay_ai alongside /chat.
  static String get aiWsBaseUrl => aiBaseUrl.replaceFirst('https://', 'wss://').replaceFirst('http://', 'ws://');

  //google auth variables
  static String appScheme = 'flutterdemo';
  static String domain = 'dev-hw66hyksz5n57uvj.us.auth0.com';
  static String clientId = '8Lwc0oXL8AYi5YyKlWJCtbMozXXo49E2';

  // Google Sign-In: the Firebase project's "Web client" OAuth client ID
  // (type 3 in google-services.json > oauth_client), NOT the Android client.
  // Required on Android for GoogleSignIn to return a usable idToken.
  static String googleServerClientId = '408649818616-ghc2sbjf3a56mug859stl11ekn7g00ub.apps.googleusercontent.com';

  //gmail variables
  static String  gApi = 'AIzaSyB4nQ29Iy_6exT-QrdPgoARI94pYZ-lfD0';
  static String  pcsId = '4700b2bb3a2c146b5';

  //database variables
  static int  pageSize = 20;
  static int  maxVideoLengthInMinutes = 5;

  //business variables
  // Display-only today: the API does not charge it. 1.5% as a fraction.
  static const double SERVICE_FEE = 0.015;
  static String get serviceFeeLabel => 'Service Fee:(${(SERVICE_FEE * 100).toStringAsFixed(1)}%)';

  //pusher variables
  static const pusherApiKey = '28d4015c1cc8edbdc8d6';

  // Redirect target for Flutterwave/Stripe hosted checkout (see
  // trust_pay_api routes/web.php `payment/callback`) — the checkout WebView
  // watches for navigation here to know the payment flow finished. It's a
  // UI signal only; the payment webhooks are the actual source of truth.
  static String get paymentCallbackUrl => '$baseUrl/payment/callback';
}
