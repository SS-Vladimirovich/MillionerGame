//
//  QuestionsViewController.swift
//  MillionerGame
//
//  Created by SERGEY SOKOLOV on 23.08.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    var questionService = QuestionService()
    var questions: [Question] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        loadQuestions()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "QuestionsCell", bundle: nil),
                           forCellReuseIdentifier: "QuestionsCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.borderColor = UIColor.white.cgColor
        tableView.layer.cornerRadius = 10
        tableView.layer.borderWidth = 2
    }
    
    private func loadQuestions() {
        questions = questionService.loadCustomQuestions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "customQuestionsSegue":
            guard let destionation = segue.destination as? CustomQuestionsViewController else { return }
            destionation.customQuestionDelegate = self
        default:
            break
        }
    }
    
}

extension QuestionsViewController: UITableViewDelegate {
    
}

extension QuestionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionsCell", for: indexPath) as? QuestionsCell
        else { return UITableViewCell() }
        cell.configure(questionsCustom: questions, indexPath: indexPath)
        return cell
    }
}

extension QuestionsViewController: CustomQuestionsVCDelegate {
    func saveQuestions(_ questions: [Question]) {
        let newQeustions = self.questions + questions
        questionService.saveCustomQuestions(newQeustions)
        self.questions = newQeustions
        self.tableView.reloadData()
    }
}
