//
//  ViewController.swift
//  estudoSwift1
//
//  Created by Pedro Henrique Spínola de Assis on 03/08/20.
//  Copyright © 2020 Pedro Spínola. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var buttonCheckList: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.cornerRadius = 15
        button2.layer.cornerRadius = 15
        button3.layer.cornerRadius = 15
        button4.layer.cornerRadius = 15
        button5.layer.cornerRadius = 15
        button6.layer.cornerRadius = 15
        button7.layer.cornerRadius = 15
        buttonCheckList.layer.cornerRadius = 15
        
        
    }
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var number1: UITextField!
    
    @IBOutlet weak var number2: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var buttonCalcular: UIButton!
    
    @IBAction func calcular(_ sender: Any) {
        
        result.text = String(calculaSoma(n1: Int(number1.text!)!, n2: Int(number2.text!)!) )
    }
    
    //sobreescrevendo a função touchesBegan para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonCalcular.layer.cornerRadius = 15
        result.layer.cornerRadius = 15
    }
    
    func calculaSoma (n1: Int, n2: Int) -> Int{
        return n1 + n2
    }
    
}

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var labelResult: UILabel!
    
    @IBAction func gerarNumero(_ sender: Any) {
        labelResult.text = String(Int.random(in: 1...10))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class FourthViewController: UIViewController {
    
    var frases = ["A luta é pesada, mas a derrota é certa", "Nada está tão ruim que não possa piorar", "Por que fazer amanhã se você pode fazer depois de amanhã?","Gostasse?", "Já oouvisse uma dose com GD?"]
    
    @IBOutlet weak var buttonNovFrase: UIButton!
    @IBOutlet weak var labelPhrase: UILabel!
    
    @IBAction func buttonNewPhrase(_ sender: Any) {
        labelPhrase.text = frases[Int.random(in: 0...4)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonNovFrase.layer.cornerRadius = 7
    }
}


class fifthViewController: UIViewController {
    
    @IBOutlet weak var precoAlcool: UITextField!
    
    @IBOutlet weak var precoGasolina: UITextField!
    
    @IBOutlet weak var labelResultado: UILabel!
    
    @IBAction func calculaCombustivel(_ sender: Any) {
        labelResultado.isHidden = false
        if let alcool = precoAlcool.text {
            if let gasolina = precoGasolina.text{
                
                let validado = self.validarCampos(precoAlcool: alcool, precoGasolina: gasolina)
                
                if validado {
                    let resultado = self.calcularMelhorPreco(pA: alcool, pG: gasolina)
                    if resultado {
                        labelResultado.text = "Melhor usar o Álcool!"
                    } else { labelResultado.text = "Melhor usar a Gasolina!"}
                } else {
                    labelResultado.text = "Insira os preços para efetuar o cálculo!"
                }
            }
        }
        
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool{
        
        var respostaValidacao = true
        
        if precoAlcool.isEmpty {
            respostaValidacao = false
        } else if precoGasolina.isEmpty {
            respostaValidacao = false
        }
        
        return respostaValidacao
    }
    
    func calcularMelhorPreco(pA: String, pG: String) -> Bool {
        var teste: Bool
        if Double(pA)!/Double(pG)! < 0.7{
            teste = true
        } else {
            teste = false
        }
        return teste
    }
    
    //  sobreescrevendo a função touchesBegan para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class sixthViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class seventhViewController: UIViewController {
    
    @IBOutlet weak var textFieldDados: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviaDados" {
            let proximaCV = segue.destination as! eighthViewController
            
            proximaCV.textoRecebido = textFieldDados.text!
        }
    }
    
    //  sobreescrevendo a função touchesBegan para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class eighthViewController: UIViewController {
    
    @IBOutlet weak var labelDados: UILabel!
    var textoRecebido: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelDados.text = textoRecebido
    }
}

class ninthViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueMoeda" {
            let nextCV = segue.destination as! tenthViewController
            
            let random = Int.random(in: 1...4)
            if random == 1 || random == 3{
                nextCV.teste = true
            } else if random == 2 || random == 4{
                nextCV.teste = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

class tenthViewController: UIViewController {
    
    @IBOutlet weak var imageMoedaCara: UIImageView!
    @IBOutlet weak var imageMoedaCoroa: UIImageView!
    var teste: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if teste == true{
            imageMoedaCara.isHidden = true
            imageMoedaCoroa.isHidden = false
        } else{
            imageMoedaCara.isHidden = false
            imageMoedaCoroa.isHidden = true
        }
        
    }
}

//Usando Table View Controller
class CheckListDiretoria2: UITableViewController {
    
    //Método para setar o número de linhas da TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lista.count
    }
    
    //Método para configurar cada célula da TableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CellDiretoria"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MyTableView2
        
        cell.labelLista.text = lista [indexPath.row]
        
        return cell
    }
    
    //Método para executar uma ação após uma célula ser clicada
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Descelecionando a célula clicada
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Criando alertas
        let alerta = UIAlertController (title: lista[indexPath.row], message: "Deseja apagar este item da lista?", preferredStyle: .alert)
        
        let acaoConfirmar = UIAlertAction (title: "Confirmar", style: .destructive){ (confirma) in
            self.lista.remove(at: indexPath.row)
            self.salvaDados()
            self.diretoriaTableView.reloadData()
        }
        let acaoCancelar = UIAlertAction (title: "Cancelar", style: .cancel, handler: nil)
        
        alerta.addAction(acaoConfirmar)
        alerta.addAction(acaoCancelar)
        
        present(alerta, animated: true, completion: nil)
    }
    
    @IBOutlet weak var diretoriaTableView: UITableView!
    
    var lista = UserDefaults.standard.stringArray(forKey: "dadosLista") ?? ["Cachoeira do urubu", "Cachoeira do convento", "Lagoa Azul", "Gravatá 2.0", "Trilha/Rapel em Gravatá", "Passeio Catamarã Rec Antigo", "Barra de Gramame (PB)", "Olinda alta", "Pipa", "Acampar Porto", "Passeio parapente em porto", "Pular de paraquedas", "Passeio de bugue em praia", "Andar de triciclo", "Andar a cavalo", "Acampar na cachoeira do Convento", "Acampar no Paiva"]
    
    var mediador = UserDefaults.standard.string(forKey: "novosDadosLista") ?? nil
    
    public func add(){
        if (mediador != nil) {
            if mediador != lista.last {
                lista.append(mediador!)
                salvaDados()
                self.diretoriaTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mediador = UserDefaults.standard.string(forKey: "novosDadosLista") ?? nil
        add()
    }
    
    func salvaDados() {
        UserDefaults.standard.set(lista, forKey: "dadosLista")
        
    }
}

public class MyTableView2: UITableViewCell {
    
    @IBOutlet weak var labelLista: UILabel!
}

class addRole: UIViewController {
    
    var novoRole = ""
    
    @IBOutlet weak var textFieldRole: UITextField!
    
    @IBAction func salvaRole(_ sender: Any) {
        novoRole = textFieldRole.text ?? ""
        UserDefaults.standard.set(novoRole, forKey: "novosDadosLista")
    }
    
    //  sobreescrevendo a função touchesBegan para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
