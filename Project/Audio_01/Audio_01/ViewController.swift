//
//  ViewController.swift
//  Audio_01
//
//  Created by Kenny on 2021/01/22.
//

import UIKit
import AVFoundation // ***

class ViewController: UIViewController, AVAudioPlayerDelegate { // <---

    @IBOutlet weak var pvProgressPlay: UIProgressView!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var slVolume: UISlider!
    @IBOutlet weak var imgView: UIImageView!
    
    var audioPlayer: AVAudioPlayer! // instance
    var audioFile: URL! // audio file name
    let maxVolume: Float = 10.0 // max volume
    var progressTimer: Timer! = nil // timer
    var imgPlay: UIImage? // play image
    var imgPause: UIImage? // pause image
    var imgStop: UIImage? // stop image

    // timer를 이용해 재생시간 표시하기
    let timePlayerSelector: Selector = #selector(ViewController.updatePlayTimes)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        audioFile = Bundle.main.url(forResource: "1988", withExtension: "mp3")
        initPlay()
        
        imgPlay = UIImage(named: "play.png")
        imgPause = UIImage(named: "pause.png")
        imgStop = UIImage(named: "stop.png")

    }

    // Audio 재생을 위한 초기화
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }catch let error as NSError{
            print("Error : initplay : \(error)")
        }
        
        // audio 초기화
        slVolume.maximumValue = maxVolume // max volume
        slVolume.value = 1.0 // volume 초기값
        pvProgressPlay.progress = 0 // progress view의 초기화
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        
        lblEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        
//        btnPlay.isEnabled = true
//        btnPause.isEnabled = false
//        btnStop.isEnabled = false
        
        // play, pause, stop 마다 버튼의 속성이 바뀌므로 함수를 만든다.
        setPlayButtons(true, false, false)
        
    }

    func setPlayButtons(_ play:Bool, _ pause:Bool, _ stop: Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    func convertNSTimeInterval2String(_ time: TimeInterval) -> String{
        let min = Int(time / 60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let startTime = String(format: "%02d:%02d", min, sec)
        return startTime
    }

    
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButtons(false, true, true)
        
        // Timer를 이용해 재생시간 표시하기
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
        
        imgView.image = imgPlay // imageview에 image 할당
    }
    
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, false, true)
        
        imgView.image = imgPause // imageview에 image 할당

    }
    
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        setPlayButtons(true, false, false)
        
        // 정지시 초기화 시키기
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        progressTimer.invalidate() // 타이머 무효화 시키기
        
        imgView.image = imgStop// imageview에 image 할당

    }
    
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    // Timer를 이용해 재생시간 표시하기
    @objc func updatePlayTimes(){
        lblCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime / audioPlayer.duration)
    }
    
    // 재생 종료시 초기화 시키기
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(true, false, false)
    }

}// ----

