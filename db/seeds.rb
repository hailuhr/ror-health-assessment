# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

patient = Patient.create(
  first_name: "Firstname",
  last_name: "Lastname",
  date_of_birth: "11/11/1911"
)

phq_questionnaire = Questionnaire.create(
  name: "Patient Health Questionnaire",
)

phq_answers = [
  {
    answer_text: "Not at all",
    value: 0
  },
  {
    answer_text: "Several days",
    value: 1
  },
  {
    answer_text: "More than half the days",
    value: 2
  },
  {
    answer_text: "Nearly every day",
    value: 3
  }
]

phq__question_subsets = {
  questionnaire_id: phq_questionnaire.id,
  subset_text: "Over the last 2 weeks, how often have you been bothered by any of the following problems?",
  questions: [
    {
      question_text: "Little interest or pleasure in doing things",
      answers: phq_answers
    },
    {
      question_text: "Feeling down, depressed, or hopeless",
      answers: phq_answers
    },
    {
      question_text: "Trouble falling/staying asleep, sleeping too much",
      answers: phq_answers
    },
    {
      question_text: "Feeling tired or having little energy",
      answers: phq_answers
    },
    {
      question_text: "Poor appetite or overeating",
      answers: phq_answers
    },
    {
      question_text: "Feeling bad about yourself or that you are a failure or have let yourself or your family down",
      answers: phq_answers
    },
    {
      question_text: "Trouble concentrating on things, such as reading the newspaper or watching television.",
      answers: phq_answers
    },
    {
      question_text: "Moving or speaking so slowly that other people could have noticed. Or the opposite; being so fidgety or restless that you have been moving around a lot more than usual.",
      answers: phq_answers
    },
    {
      question_text: "Thoughts that you would be better off dead or of hurting yourself in some way.",
      answers: phq_answers
    }
  ]
},
{
  questionnaire_id: phq_questionnaire.id,
  subset_text: "If you checked off any problem on this questionnaire so far, how difficult have these problems made it for you to do your work, take care of things at home, or get along with other people?",
  questions: [
    {
      question_text: "If you checked off any problem on this questionnaire so far, how difficult have these problems made it for you to do your work, take care of things at home, or get along with other people?",
      answers: phq_answers
    }
  ]
}

sds_questionnaire = Questionnaire.create(
  name: "Sheehan Disability Scale"
)

sds_question_subsets_1_answers = [
  {
    title: "0 - Not at all",
    value: 0
  },
  {
    title: "1 - Mildly",
    value: 1
  },
  {
    title: "2 - Mildly",
    value: 2
  },
  {
    title: "3 - Mildly",
    value: 3
  },
  {
    title: "4 - Moderately",
    value: 4
  },
  {
    title: "5 - Moderately",
    value: 5
  },
  {
    title: "6 - Moderately",
    value: 6
  },
  {
    title: "7 - Markedly",
    value: 7
  },
  {
    title: "8 - Markedly",
    value: 8
  },
  {
    title: "9 - Markedly",
    value: 9
  },
  {
    title: "10 - Extremely",
    value: 10
  }
]

sds_question_subsets_2_answers = sds_question_subsets_1_answers.first(8)

sds_question_subsets = [
  {
    questionnaire_id: sds_questionnaire.id,
    subset_text: "A brief, patient rated, measure of disability and impairment.",
    questions: [
      {
        question_text: "The symptoms have disrupted your work / school work:",
        answers: sds_question_subsets_1_answers
      },
      {
        question_text: "The symptoms have disrupted your social life / leisure activities:",
        answers: sds_question_subsets_1_answers
      },
      {
        question_text: "The symptoms have disrupted your family life / home responsibilities:",
        answers: sds_question_subsets_1_answers
      }
    ]
  },
  {
    questionnaire_id: sds_questionnaire.id,
    subset_text: "Days Lost",
    questions: [
      {
        question_text: "Days Lost",
        answers: sds_question_subsets_2_answers
      }
    ]
  },
  {
    questionnaire_id: sds_questionnaire.id,
    subset_text: "Days Unproductive",
    questions: [
      {
        question_text: "Days Unproductive",
        answers: sds_question_subsets_2_answers
      }
    ]
  }
]

all_subsets = phq__question_subsets.concat(sds_question_subsets)

all_subsets.each do |sub|

  subset = Subset.create(subset_text: sub[:subset_text])

  questions = sub[:questions].each do |question|
    q = Question.create(
      question_text: question[:question_text],
      subset_id: subset[:id],
      questionnaire_id: sub[:questionnaire_id]
    )

    question[:answers].each do |answer|
      Answer.create(
        answer_text: answer[:answer_text] ? answer[:answer_text] : nil,
        value: answer[:value],
        question_id: q.id
      )
    end
  end
end


assessment_one = Assessment.create(questionnaire_id: 1, patient_id: 1, assessment_name: "assessment1", date: "01/01/2001")
assessment_two = Assessment.create(questionnaire_id: 2, patient_id: 1, assessment_name: "assessment2", date: "02/02/2002")

assessment_one.questionnaire.questions.each { |q| PatientsAnswer.create(assessment_id: assessment_one.id, patient_id: assessment_one.patient.id, answer_id: q.answers.last.id) }
assessment_two.questionnaire.questions.each { |q| PatientsAnswer.create(assessment_id: assessment_two.id, patient_id: assessment_two.patient.id, answer_id: q.answers.last.id) }
