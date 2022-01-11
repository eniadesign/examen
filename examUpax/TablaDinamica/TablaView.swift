//
//  MesssageMain.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//


import UIKit
import Charts
import BusinessChat

class TablaView: UIViewController{
        
        weak var delegate: TablaViewDelegate?
        var presenter: TablaPresenter?
        private var ui = TablaViewUI()
        var getUser: String?
        var players: [String] = []
        var sucursales_contenedor: [String] = []
        var sucursales_valores: [Int] = []
        var preguntas: [String] = []
        var pregunta: String?
        var colores = [""]
        var color = [""]
        var goals: [Int] = []
        var n: Int? = 0
        var s: Int? = 0
        
        override func loadView() {
            ui = TablaViewUI(navigation: self.navigationController!, getuser: getUser!)
            ui.delegate = self
            view = ui
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationController?.isNavigationBarHidden = true
           
            delegate = self
            
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
        delegate?.notifyOperations()
    }
    
    
    // MARK:Graficas
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        colors.append(color)
      }
      return colors
    }
    
    
    func customizeChart(dataPoints: [String], values: [Double], grafica: PieChartView, preg: String) {
        // 1. Set ChartDataEntry
          var dataEntries: [ChartDataEntry] = []
          for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
          }
          // 2. Set ChartDataSet
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
          pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
          // 3. Set ChartData
          let pieChartData = PieChartData(dataSet: pieChartDataSet)
          let format = NumberFormatter()
          format.numberStyle = .none
          let formatter = DefaultValueFormatter(formatter: format)
          pieChartData.setValueFormatter(formatter)
          // 4. Assign it to the chart’s data
        grafica.centerText = preg
        grafica.sizeToFit()
        grafica.centerTextOffset = CGPoint(x: -60, y: -150)
        grafica.data = pieChartData
       
    }
      
    }


extension TablaView: TablaViewDelegate{
  
    func preguntas(pregunta: String) {
        players.append(pregunta)
    }
    
    func getPerfilData() {
        
    }
    
    func getMessageData() {
        presenter?.read_profile()
       
    }
    
    
        func notifyOperations() {
            presenter?.read_user()
        }
        
        func showUser(data: TablaEntity) {
            colores = data.colors
            n = 0
            for item in colores {
                
                print(item)
                
                let str = item.replacingOccurrences(of: "#", with: "", options: NSString.CompareOptions.literal, range: nil)
                let number = UInt(str, radix: 16)!
                color.append("\(number)")
                print(n as Any)
                
                n! += 1
            }
            
           
            //Empresas
            for q in data.questions {
                if q.text == data.questions[1].text {
                    pregunta = q.text
                for chard in q.chartData {
                        players.append(chard.text)
                        goals.append(chard.percetnage ?? 0)
                    
                    customizeChart(dataPoints: players, values: goals.map{ Double($0) }, grafica: ui.pieChart2, preg: pregunta!)
                    
                    }
                }
            }
            
            //Sucursal
            for h in data.questions {
                if h.text == data.questions[0].text {
                    pregunta = h.text
                for sucursal in h.chartData {
                        sucursales_contenedor.append(sucursal.text)
                        sucursales_valores.append(sucursal.percetnage ?? 0)
                    
                    customizeChart(dataPoints: sucursales_contenedor, values: sucursales_valores.map{ Double($0) }, grafica: ui.pieChart, preg: pregunta!)
                    
                    }
                }
            }
            
            
            
          
           
           
            
            ui.pieChart.reloadInputViews()
           
          
        }
    }


