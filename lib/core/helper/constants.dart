import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

final List onboarding = [
  {
    'image': 'assets/svgs/onboarding.svg',
    'text1': 'Join our app ',
    'text2': "Join our app revolutionizing blood and plasma donation in Egypt",
    'text3': "",
    'text4': "NEXT",
  },
  {
    'image': 'assets/svgs/onboarding2.svg',
    'text1': 'Get points',
    'text2':
        " you can save the lives of one to three people, And  you can get points for it also ",
    'text3': "PREV",
    'text4': "NEXT",
  },
  {
    'image': 'assets/svgs/onboarding3.svg',
    'text1': 'Check your Health',
    'text2':
        "using AI to predict  if there is a possibility of contracting a specific disease",
    'text3': "PREV",
    'text4': "Get Standerd",
  },
];
final List questions = [
  {
    'question': "What is blood donation?",
    'answer':
        "Blood donation is the voluntary act of giving blood, which is used to help patients who need transfusions for medical treatments or emergencies.",
  },
  {
    'question': "Who can donate blood?",
    'answer':
        "Generally, donors must be in good health, weigh at least a certain amount, and meet age requirements (typically 18 years or older).",
  },
  {
    'question': "How often can I donate blood?",
    'answer':
        "Donation frequency varies by country and organization, but typically you can donate whole blood every 8 to 12 weeks.",
  },
  {
    'question': "Are there any risks to donating blood?",
    'answer':
        "Blood donation is generally safe. Possible risks include minor bruising, dizziness, or feeling faint, which are usually temporary.",
  },
  {
    'question': "How is donated blood used?",
    'answer':
        "Eat a healthy meal, drink plenty of fluids, and get a good night's rest. Avoid fatty foods immediately before donation.",
  },
  {
    'question': "Can I donate blood if I've had tattoos or piercings?",
    'answer':
        "Donated blood is separated into components such as red blood cells, plasma, and platelets, which are used to treat various medical conditions and emergencies.",
  },
  {
    'question': "Where can I donate blood?",
    'answer':
        "Requirements vary by location, but typically there is a waiting period after getting a tattoo or piercing before you can donate blood. Check with your local blood donation center for specific guidelines.",
  },
  {
    'question': "How often can you donate plasma?",
    'answer':
        "Blood donations are usually collected at blood donation centers, hospitals, or mobile blood drives organized by blood banks.",
  },
  {
    'question': "Where can I donate? What are your hours?",
    'answer':
        " permit two plasma donations within a seven-day period, with at least 2 days in between those two donations. Your body replaces the donated plasma within 24 to 48 hours. This means that if you donate on Monday, you can donate again on Wednesday. So, drink plenty of water following donations to help your body replace fluids.\n\nIf you want to permanently switch the days that you donate, that is not a problem. Most people wait a full seven-days in-between weekly schedules to guarantee they can select any new days they prefer to avoid any issues. Contact your local donation center staff to discuss the easiest way to change your schedule.",
  },
  {
    'question': "Can I switch plasma donation centers?",
    'answer':
        "Yes! Transferring between Plasma centers is easier than ever! You can easily transfer to donate at the center that’s most convenient for you, with no wait time or paperwork. Transferring centers won’t affect your donor qualification status and can be completed at a kiosk. See your new donation center staff for help or questions about transferring."
  },
  {
    'question': "What is plasma?",
    'answer':
        "Plasma is the liquid part of your blood that carries red blood cells, white blood cells, and platelets. It’s made mostly of water and proteins. Because it has so much protein in it, plasma is used to make life-saving medicines that treat patients who have experienced trauma, have bleeding disorders, have trouble fighting infections because of immune disorders, and more.",
  },
  {
    'question': "How does plasma donation work?",
    'answer':
        "Donating plasma is similar to giving blood. A trained staff member called a phlebotomist puts a sterile needle in your arm vein to draw blood. The blood is then cycled through single-use, sterile equipment that separates plasma from the other parts of your blood. Your plasma is then collected in a container, while the other parts of your blood are safely returned to your body. This process is called plasmapheresis.",
  },
  {
    'question': "Is donating plasma safe?",
    'answer':
        "Yes, donating plasma is safe. All material that comes in contact with your blood is sterile and used only 1 time for your plasma donation. Our highly trained staff follows strict guidelines to make sure you’re comfortable and safe throughout the process. Our plasma centers follow all required U.S. Food and Drug Administration (FDA) regulatory standards for plasma donation.",
  },
];
