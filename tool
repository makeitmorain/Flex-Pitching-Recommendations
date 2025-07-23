<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flex Pitching Programming Decision Tree</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .header {
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 2.2em;
            margin-bottom: 10px;
            font-weight: 600;
        }
        
        .header p {
            font-size: 1.1em;
            opacity: 0.9;
        }
        
        .content {
            padding: 40px;
        }
        
        .question-container {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            border-left: 5px solid #3498db;
        }
        
        .question {
            font-size: 1.3em;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        
        .options {
            display: grid;
            gap: 15px;
        }
        
        .option {
            padding: 15px 20px;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: white;
            font-size: 1em;
        }
        
        .option:hover {
            border-color: #3498db;
            background: #f1f8ff;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.2);
        }
        
        .option.selected {
            border-color: #3498db;
            background: #3498db;
            color: white;
        }
        
        .next-btn {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 25px;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 20px;
        }
        
        .next-btn:hover:not(:disabled) {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(52, 152, 219, 0.3);
        }
        
        .next-btn:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }
        
        .result {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            margin-top: 30px;
        }
        
        .result h2 {
            font-size: 1.8em;
            margin-bottom: 15px;
        }
        
        .result p {
            font-size: 1.1em;
            line-height: 1.6;
            margin-bottom: 10px;
        }
        
        .progression {
            background: white;
            color: #2c3e50;
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
        }
        
        .progression h3 {
            color: #27ae60;
            margin-bottom: 15px;
        }
        
        .phase-list {
            list-style: none;
            padding: 0;
        }
        
        .phase-list li {
            padding: 8px 0;
            border-bottom: 1px solid #ecf0f1;
            font-weight: 500;
        }
        
        .phase-list li:last-child {
            border-bottom: none;
        }
        
        .reset-btn {
            background: #95a5a6;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            cursor: pointer;
            margin-top: 20px;
            transition: all 0.3s ease;
        }
        
        .reset-btn:hover {
            background: #7f8c8d;
        }
        
        .hidden {
            display: none;
        }
        
        .warning {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            color: #856404;
            padding: 15px;
            border-radius: 10px;
            margin-top: 15px;
        }
        
        .age-note {
            background: #e8f4fd;
            border: 1px solid #b8daff;
            color: #0c5460;
            padding: 15px;
            border-radius: 10px;
            margin-top: 15px;
            font-size: 0.95em;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🥎 Flex Pitching Programming Decision Tree</h1>
            <p>Answer a few questions to determine the best training path for your athlete</p>
        </div>
        
        <div class="content">
            <!-- Question 1: Starting Scenario -->
            <div class="question-container" id="q1">
                <div class="question">1. What's your starting scenario with this athlete?</div>
                <div class="options">
                    <div class="option" data-value="snapshot">New athlete with completed Snapshot assessment</div>
                    <div class="option" data-value="remote">New athlete starting remotely (no assessment)</div>
                </div>
                <button class="next-btn" disabled onclick="nextQuestion(1)">Next Question</button>
            </div>
            
            <!-- Question 2: Age -->
            <div class="question-container hidden" id="q2">
                <div class="question">2. What's the athlete's age?</div>
                <div class="options">
                    <div class="option" data-value="8-10">8-10 years old</div>
                    <div class="option" data-value="11-12">11-12 years old</div>
                    <div class="option" data-value="13-14">13-14 years old</div>
                    <div class="option" data-value="15">15 years old</div>
                </div>
                <button class="next-btn" disabled onclick="nextQuestion(2)">Next Question</button>
            </div>
            
            <!-- Question 3: Driveline Experience -->
            <div class="question-container hidden" id="q3">
                <div class="question">3. What's the athlete's experience with Driveline training?</div>
                <div class="options">
                    <div class="option" data-value="new">Completely new to Driveline training</div>
                    <div class="option" data-value="returning">Returning athlete (previously trained with Driveline)</div>
                    <div class="option" data-value="3rd-party">Has 3rd party experience with Driveline protocols</div>
                </div>
                <button class="next-btn" disabled onclick="nextQuestion(3)">Next Question</button>
            </div>
            
            <!-- Question 4: Time Until Season -->
            <div class="question-container hidden" id="q4">
                <div class="question">4. How much time until their season starts?</div>
                <div class="options">
                    <div class="option" data-value="14+">14+ weeks (3+ months)</div>
                    <div class="option" data-value="8-14">8-14 weeks (2-3 months)</div>
                    <div class="option" data-value="6-8">6-8 weeks (1.5-2 months)</div>
                    <div class="option" data-value="<6">Less than 6 weeks</div>
                </div>
                <button class="next-btn" disabled onclick="nextQuestion(4)">Next Question</button>
            </div>
            
            <!-- Question 5: Fall Ball -->
            <div class="question-container hidden" id="q5">
                <div class="question">5. Is the athlete currently playing fall ball or in-season?</div>
                <div class="options">
                    <div class="option" data-value="yes">Yes, currently playing games</div>
                    <div class="option" data-value="no">No, in offseason</div>
                    <div class="option" data-value="ending">Season ending soon (within 2 weeks)</div>
                </div>
                <button class="next-btn" disabled onclick="showResult()">Get Recommendation</button>
            </div>
            
            <!-- Result -->
            <div class="result hidden" id="result">
                <h2 id="resultTitle">Your Recommended Programming Path</h2>
                <p id="startingPhase"></p>
                <p id="reasoning"></p>
                <div class="progression" id="progressionPlan">
                    <h3>Recommended Progression:</h3>
                    <ul class="phase-list" id="phaseList"></ul>
                </div>
                <div id="specialNotes"></div>
                <button class="reset-btn" onclick="resetTool()">Start Over</button>
            </div>
        </div>
    </div>

    <script>
        let answers = {};
        
        // Add click handlers for options
        document.addEventListener('DOMContentLoaded', function() {
            const options = document.querySelectorAll('.option');
            options.forEach(option => {
                option.addEventListener('click', function() {
                    const parent = this.closest('.question-container');
                    const siblings = parent.querySelectorAll('.option');
                    siblings.forEach(s => s.classList.remove('selected'));
                    this.classList.add('selected');
                    
                    const questionId = parent.id;
                    answers[questionId] = this.dataset.value;
                    
                    const nextBtn = parent.querySelector('.next-btn');
                    nextBtn.disabled = false;
                });
            });
        });
        
        function nextQuestion(current) {
            document.getElementById('q' + current).classList.add('hidden');
            let next = current + 1;
            document.getElementById('q' + next).classList.remove('hidden');
        }
        
        function showResult() {
            document.getElementById('q5').classList.add('hidden');
            
            const recommendation = generateRecommendation();
            
            document.getElementById('resultTitle').textContent = recommendation.title;
            document.getElementById('startingPhase').textContent = recommendation.startingPhase;
            document.getElementById('reasoning').textContent = recommendation.reasoning;
            
            const phaseList = document.getElementById('phaseList');
            phaseList.innerHTML = '';
            recommendation.phases.forEach(phase => {
                const li = document.createElement('li');
                li.textContent = phase;
                phaseList.appendChild(li);
            });
            
            const specialNotes = document.getElementById('specialNotes');
            specialNotes.innerHTML = '';
            if (recommendation.warnings.length > 0) {
                recommendation.warnings.forEach(warning => {
                    const div = document.createElement('div');
                    div.className = 'warning';
                    div.textContent = warning;
                    specialNotes.appendChild(div);
                });
            }
            
            if (recommendation.notes.length > 0) {
                recommendation.notes.forEach(note => {
                    const div = document.createElement('div');
                    div.className = 'age-note';
                    div.textContent = note;
                    specialNotes.appendChild(div);
                });
            }
            
            document.getElementById('result').classList.remove('hidden');
        }
        
        function generateRecommendation() {
            const isNew = answers.q3 === 'new';
            const age = answers.q2;
            const timeUntilSeason = answers.q4;
            const inSeason = answers.q5 === 'yes';
            const seasonEnding = answers.q5 === 'ending';
            
            let recommendation = {
                title: "Recommended Programming Path",
                startingPhase: "",
                reasoning: "",
                phases: [],
                warnings: [],
                notes: []
            };
            
            // Handle in-season athletes first
            if (inSeason) {
                recommendation.title = "In-Season Management";
                recommendation.startingPhase = "Start with: Game Prep Phase";
                recommendation.reasoning = "Since the athlete is currently in-season, focus on maintaining arm health and workload management.";
                recommendation.phases = [
                    "Game Prep Phase (ongoing)",
                    "Monitor throwing workload",
                    "Maintenance work between starts",
                    "Plan development phases for post-season"
                ];
                recommendation.warnings.push("Avoid high-intensity velocity work during competitive season");
                return recommendation;
            }
            
            // Handle season ending soon
            if (seasonEnding) {
                recommendation.warnings.push("Wait 2-4 weeks after season ends before starting intensive training");
                recommendation.notes.push("Allow proper recovery time after competitive season before beginning development phases");
            }
            
            // Determine starting phase
            if (isNew) {
                recommendation.startingPhase = "Start with: 8-Week On-Ramp Phase";
                recommendation.reasoning = "All new athletes must complete the full 8-week on-ramp to safely build throwing capacity.";
            } else if (answers.q3 === '3rd-party') {
                recommendation.startingPhase = "Start with: Modified On-Ramp (4-6 weeks)";
                recommendation.reasoning = "Athlete has some experience with Driveline protocols but needs assessment of current form and capacity.";
            } else {
                recommendation.startingPhase = "Start with: 8-Week On-Ramp Phase";
                recommendation.reasoning = "Returning athletes who haven't trained recently need full on-ramp for safety.";
            }
            
            // Generate progression based on time available
            if (timeUntilSeason === '14+') {
                // Full development path
                recommendation.phases = [
                    "8-Week On-Ramp Phase",
                    "6-Week Velocity Phase (Pulldowns)",
                    "6-Week Second Velocity Phase or Mound Blend",
                    "6-Week Command Focus Phase", 
                    "6-Week Competition Prep Phase"
                ];
                
                if (age === '15') {
                    recommendation.notes.push("15u athletes eligible for PlyoVelo phase as second velocity option");
                    recommendation.phases[2] = "6-Week Second Velocity Phase (PlyoVelo option for 15u)";
                }
                
            } else if (timeUntilSeason === '8-14') {
                // Moderate development path
                if (isNew) {
                    recommendation.phases = [
                        "8-Week On-Ramp Phase",
                        "6-Week Velocity Phase (Pulldowns)",
                        "6-Week Command Focus or Mound Blend",
                        "Remaining time: Competition Prep"
                    ];
                } else if (answers.q3 === '3rd-party') {
                    recommendation.phases = [
                        "4-6 Week Modified On-Ramp",
                        "6-Week Velocity Phase (Pulldowns)", 
                        "6-Week Command Focus Phase",
                        "Remaining time: Competition Prep"
                    ];
                } else {
                    recommendation.phases = [
                        "8-Week On-Ramp Phase",
                        "6-Week Velocity Phase (Pulldowns)", 
                        "Remaining time: Command Focus or Competition Prep"
                    ];
                }
                
            } else if (timeUntilSeason === '6-8') {
                // Command/Game prep path
                if (answers.q3 === '3rd-party') {
                    recommendation.phases = [
                        "4-6 Week Modified On-Ramp",
                        "6-Week Command Focus OR Mound Blend Phase",
                        "Remaining time: Game Prep"
                    ];
                } else {
                    recommendation.phases = [
                        isNew ? "4-6 Week On-Ramp" : "2-4 Week Brief On-Ramp",
                        "6-Week Command Focus OR Mound Blend Phase",
                        "Remaining time: Game Prep"
                    ];
                }
                recommendation.warnings.push("Skip velocity development phases due to limited time");
                
            } else {
                // Less than 6 weeks
                recommendation.phases = [
                    "Game Prep Phase immediately",
                    "Focus on competition readiness",
                    "Minimal development work"
                ];
                recommendation.warnings.push("Very limited time - focus on game preparation only");
                if (isNew) {
                    recommendation.warnings.push("Consider abbreviated 2-3 week on-ramp if athlete is new to differential balls");
                } else if (answers.q3 === '3rd-party') {
                    recommendation.warnings.push("Even with 3rd party experience, some on-ramp assessment recommended");
                }
            }
            
            // Age-specific notes
            if (age === '8-10') {
                recommendation.notes.push("Focus on fun and engagement over velocity gains. Extended on-ramp periods recommended.");
            } else if (age === '11-12') {
                recommendation.notes.push("Use 12u & Younger templates. Baseball-only throwing for velocity work.");
            } else if (age === '13-14') {
                recommendation.notes.push("Use 13-14u templates. Hybrid B maintenance work between high-intent days.");
            } else if (age === '15') {
                recommendation.notes.push("Use 15u+ templates. Eligible for PlyoVelo phase and Live AB competition prep.");
            }
            
            // Assessment-specific notes
            if (answers.q1 === 'snapshot') {
                recommendation.notes.push("Use Snapshot data to determine mechanical bucket and customize drill selection.");
            } else {
                recommendation.notes.push("Consider scheduling Snapshot assessment after initial on-ramp phase for data-driven programming.");
            }
            
            return recommendation;
        }
        
        function resetTool() {
            answers = {};
            
            // Reset all questions
            document.querySelectorAll('.question-container').forEach(q => {
                q.classList.add('hidden');
                q.querySelectorAll('.option').forEach(opt => opt.classList.remove('selected'));
                q.querySelector('.next-btn').disabled = true;
            });
            
            // Hide result and show first question
            document.getElementById('result').classList.add('hidden');
            document.getElementById('q1').classList.remove('hidden');
        }
    </script>
</body>
</html>
