HTMLWidgets.widget({

  name: 'multiQuestions',

  type: 'output',

  factory: function(el, width, height) {

    return {

      renderValue: function(x) {

        // --------------- Get questions from R function and all other variables --------

        var quizQuestions = JSON.parse(x.questions);
        var quizType = x.choice || "single";

        // Shuffle question order if enabled (Fisher-Yates shuffle)
        if (x.shuffle === "true") {
          for (var si = quizQuestions.length - 1; si > 0; si--) {
            var sj = Math.floor(Math.random() * (si + 1));
            var temp = quizQuestions[si];
            quizQuestions[si] = quizQuestions[sj];
            quizQuestions[sj] = temp;
          }
          // Update question IDs to reflect new order
          for (var si = 0; si < quizQuestions.length; si++) {
            quizQuestions[si].id = si + 1;
          }
        }

        // Get ID from htmlwidget container
        var widgetId = document.getElementById(el.id).id;
        var widgetEl = document.getElementById(widgetId);

        // Get title
        title = x.title;

        // Get few style params
        var centerWidget = x.center;
        var scrollWidget = x.scroll;
        var inclTimer = x.inclTimer;
        var showSolutionBtn = x.showSolutionBtn;
        var fontFamily = x.fontFamily;
        var fontSize = x.fontSize;
        var titleFontSize = x.titleFontSize;
        var questionFontSize = x.questionFontSize;
        var titleCol = x.titleCol;
        var titleBg = x.titleBg;
        var mainCol = x.mainCol;
        var mainBg = x.mainBg;
        var answersCol = x.answersCol;
        var answersBg = x.answersBg;
        var hoverBg = x.hoverBg;
        var timerCol = x.timerCol;

        // Helper: apply styles to all elements matching a selector within this widget
        function styleAll(selector, styles) {
          var els = widgetEl.querySelectorAll(selector);
          els.forEach(function(el) {
            for (var prop in styles) {
              el.style[prop] = styles[prop];
            }
          });
        }

        // ------------ Create all HTML elements -----------------------

        var divWidget = document.getElementById(el.id);

        // QUIZ CONTAINER
        var divQuiz = document.createElement("div");
        divQuiz.classList.add("mqq-quiz");
        // add user-specific CSS
        divQuiz.style.height = divWidget.style.height * 0.99;
        divQuiz.style.backgroundColor = mainBg;
        divQuiz.style.fontFamily = fontFamily;
        divQuiz.style.fontSize = fontSize+'px';
        divQuiz.style.lineHeight = fontSize*1.5+'px';

        // HEADER PART
        var divHeader = document.createElement("div");
        divHeader.classList.add("mqq-header");
        // add user-specific CSS
        divHeader.style.backgroundColor = titleBg;

        var divTitle = document.createElement("div");
        divTitle.classList.add("mqq-left-title");
        divTitle.innerHTML = title;
        // add user-specific CSS
        divTitle.style.color = titleCol;
        divTitle.style.fontFamily = fontFamily;
        divTitle.style.fontSize = titleFontSize+'px';
        divTitle.style.lineHeight = titleFontSize*1.2+'px';
        if (x.titleAlign) divTitle.style.textAlign = x.titleAlign;

        var divSubtitle = document.createElement("div");
        divSubtitle.classList.add("mqq-right-title");
        divSubtitle.innerHTML = x.txtTotalQuestions + ": ";
        // add user-specific CSS
        divSubtitle.style.color = titleCol;
        divSubtitle.style.fontFamily = fontFamily;
        divSubtitle.style.fontSize = titleFontSize+'px';
        divSubtitle.style.lineHeight = titleFontSize*1.2+'px';
        divSubtitle.style.marginRight = titleFontSize*2.2+'px';
        divSubtitle.style.flex = '0 0 '+ titleFontSize*11+'px';

        var spanTque = document.createElement("span");
        spanTque.classList.add("mqq-tque");

        var divClear= document.createElement("div");
        divClear.classList.add("mqq-clearfix");

        // Append all header elements to quiz divContainer
        divSubtitle.appendChild(spanTque);
        divHeader.appendChild(divTitle);
        divHeader.appendChild(divSubtitle);
        divHeader.appendChild(divClear);
        divQuiz.appendChild(divHeader);



        // QUIZ CONTENT PART
        var divContent = document.createElement("div");
        divContent.classList.add("mqq-content");

        var divContainer = document.createElement("div");
        divContainer.classList.add("mqq-container-fluid");

        var divRow = document.createElement("div");
        divRow.classList.add("mqq-row");

        var divCol = document.createElement("div");
        divCol.classList.add("mqq-col");

        var divQuizBody = document.createElement("div");
        divQuizBody.classList.add("mqq-quiz-body");

        var divForm = document.createElement("form");
        divForm.name = "quizForm";

        var divFieldset= document.createElement("fieldset");
        divFieldset.classList.add("mqq-form-group");

        var hQuestion = document.createElement("h4");
        hQuestion.classList.add("mqq-question-header");
        // add user-specific CSS
        hQuestion.style.color = mainCol;
        hQuestion.style.fontFamily = fontFamily;
        hQuestion.style.fontSize = questionFontSize+'px';
        hQuestion.style.lineHeight = questionFontSize*1.5+'px';

        var spanQid = document.createElement("span");
        spanQid.classList.add("mqq-question-qid");
        var spanQuestion = document.createElement("span");
        spanQuestion.classList.add("mqq-question-span");

        var divOption = document.createElement("div");
        divOption.classList.add("mqq-option-block-container");

        var divButtons =  document.createElement("div");
        divButtons.classList.add("mqq-button-container");

        var buttonPrev = document.createElement("button");
        buttonPrev.name = "previous";
        buttonPrev.classList.add("mqq-btn", "mqq-previous");
        buttonPrev.setAttribute('tabindex', '0');
        buttonPrev.innerHTML = x.txtPrevious;
        // add user-specific CSS
        buttonPrev.style.fontFamily = fontFamily;
        buttonPrev.style.fontSize = fontSize+'px';
        buttonPrev.style.lineHeight = fontSize*1.375+'px';
        buttonPrev.style.padding = fontSize*0.375+'px ' + fontSize*0.75+'px';
        buttonPrev.style.borderRadius = fontSize*0.25+'px';
        buttonPrev.style.color = x.navBtnCol;
        buttonPrev.style.backgroundColor = x.navBtnBg;
        buttonPrev.style.borderColor = x.navBtnBg;

        var buttonNext = document.createElement("button");
        buttonNext.name = "next";
        buttonNext.classList.add("mqq-btn", "mqq-next");
        buttonNext.setAttribute('tabindex', '0');
        buttonNext.innerHTML = x.txtNext;
        // add user-specific CSS
        buttonNext.style.fontFamily = fontFamily;
        buttonNext.style.fontSize = fontSize+'px';
        buttonNext.style.lineHeight = fontSize*1.375+'px';
        buttonNext.style.padding = fontSize*0.375+'px ' + fontSize*0.75+'px';
        buttonNext.style.borderRadius = fontSize*0.25+'px';
        buttonNext.style.color = x.navBtnCol;
        buttonNext.style.backgroundColor = x.navBtnBg;
        buttonNext.style.borderColor = x.navBtnBg;

        var timer = document.createElement("input");
        timer.classList.add("mqq-timer");
        timer.type = "text";
        timer.setAttribute('tabindex', '-1');
        timer.setAttribute('aria-label', 'Timer');
        timer.readOnly = true;
        timer.value = "0:00";
        // add user-specific CSS
        timer.style.color = timerCol;
        timer.style.fontFamily = fontFamily;
        timer.style.fontSize = fontSize+'px';
        timer.style.lineHeight = fontSize*1.25+'px';
        timer.style.width = fontSize*5+'px';


        // Append all the quiz content elements
        hQuestion.appendChild(spanQid);
        hQuestion.appendChild(spanQuestion);
        divButtons.appendChild(buttonPrev);
        divButtons.appendChild(buttonNext);
        if (inclTimer === "true") {
          divButtons.appendChild(timer);
        }

        divFieldset.appendChild(hQuestion);
        divFieldset.appendChild(divOption);
        divFieldset.appendChild(divButtons);

        divForm.appendChild(divFieldset);
        divQuizBody.appendChild(divForm);
        divCol.appendChild(divQuizBody);
        divRow.appendChild(divCol);
        divContainer.appendChild(divRow);
        divContent.appendChild(divContainer);
        divQuiz.appendChild(divContent);

        // Append final quiz to htmlwidget container
        divWidget.appendChild(divQuiz);

        // Modify parent element (the htmlwidget div)
        divWidget.style.borderRadius = "5px";
        if (centerWidget === "true") {
          divWidget.style.marginLeft = "auto";
          divWidget.style.marginRight = "auto";
        }
        if (scrollWidget === "true") {
          divWidget.style.overflowY = "auto";
          divWidget.style.overflowX = "hidden";
        }



        // --------------- Functions -------------------

        var quizApp = function() {

        	this.score = 0;
        	this.qno = 1;
        	this.currentque = 0;
        	var totalque = quizQuestions.length;

          // Function that generates the questions
        	this.displayQuiz = function(cque) {

        		this.currentque = cque;

        		if(this.currentque <  totalque) {
        			widgetEl.querySelector('.mqq-tque').innerHTML = totalque;
        			widgetEl.querySelector('.mqq-previous').disabled = false;
        			widgetEl.querySelector('.mqq-next').disabled = false;
        			widgetEl.querySelector('.mqq-question-qid').innerHTML = quizQuestions[this.currentque].id + '. ';

        			widgetEl.querySelector('.mqq-question-span').innerHTML = quizQuestions[this.currentque].question;
        			widgetEl.querySelector('.mqq-option-block-container').innerHTML = "";

              var inputType = (quizType === "multiple") ? "checkbox" : "radio";
        			for (var key in quizQuestions[this.currentque].options[0]) {
        			  if (quizQuestions[this.currentque].options[0].hasOwnProperty(key)) {
          				widgetEl.querySelector('.mqq-option-block-container').insertAdjacentHTML('beforeend',
          					"<div class='mqq-option-block' tabindex='0' role='" + (inputType === "checkbox" ? "checkbox" : "radio") + "' aria-checked='false'>" +
          					"<label class='mqq-form-check-label'>" +
          							  "<input type='" + inputType + "' class='mqq-form-check-input' name='option'   id='q"+
          							  key+"' value='"+quizQuestions[this.currentque].options[0][key]+
                          "'><span class='optionval'>" +
          								  quizQuestions[this.currentque].options[0][key] +
          							 "</span></label></div>");
        			  }
        			}
              // add user-specific CSS (scoped to this widget)
              styleAll('.mqq-option-block', {color: answersCol, backgroundColor: answersBg});

              // hover effect via event delegation on the container
              var optContainer = widgetEl.querySelector('.mqq-option-block-container');
              optContainer.addEventListener('mouseenter', function(e) {
                var block = e.target.closest('.mqq-option-block');
                if (block) block.style.backgroundColor = hoverBg;
              }, true);
              optContainer.addEventListener('mouseleave', function(e) {
                var block = e.target.closest('.mqq-option-block');
                if (block) block.style.backgroundColor = answersBg;
              }, true);

              // Keyboard: Enter/Space selects option
              optContainer.addEventListener('keydown', function(e) {
                if (e.key === 'Enter' || e.key === ' ') {
                  var block = e.target.closest('.mqq-option-block');
                  if (block) {
                    e.preventDefault();
                    var input = block.querySelector('input');
                    if (input) {
                      input.checked = !input.checked;
                      // Trigger change event for radio buttons to uncheck others
                      input.dispatchEvent(new Event('change', { bubbles: true }));
                      block.setAttribute('aria-checked', input.checked ? 'true' : 'false');
                    }
                  }
                }
              });

              styleAll('.optionval', {
                fontSize: fontSize+'px',
                lineHeight: fontSize*1.5+'px',
                marginLeft: fontSize*0.875+10+'px'
              });
              styleAll('.mqq-form-check-input', {
                width: fontSize*0.875+'px',
                height: fontSize*0.875+'px',
                marginTop: (fontSize*1.5-fontSize*0.875)/1.7+'px'
              });

        		  // Set focus on first option for keyboard navigation
        		  var firstOption = widgetEl.querySelector('.mqq-option-block');
        		  if (firstOption) {
        		    setTimeout(function() { firstOption.focus(); }, 50);
        		  }
        		}
        		if(this.currentque <= 0) {
        			widgetEl.querySelector('.mqq-previous').disabled = true;
        		}
        		if(this.currentque >= totalque) {
        				widgetEl.querySelector('.mqq-next').disabled = true;
        				for(var i = 0; i < totalque; i++) {
        					this.score = this.score + quizQuestions[i].score;
        				}
        			return this.showResult(this.score);
        		}
        	};


          // Function that shows the results
        	this.showResult = function(scr) {

            // First stop timer
            if (inclTimer === "true") {
              clearInterval(timeInt);
            }

            // Replace content in the quiz-body div
            var quizBody = widgetEl.querySelector('.mqq-quiz-body');
        		quizBody.classList.add('result');
        		quizBody.innerHTML = "<h3 class='mqq-res-header'>" + x.txtTotalScore + ": &nbsp;" +
            scr  + '/' + totalque + "</h3>";

        		for(var j = 0; j < totalque; j++) {
        			var res;
        			if(quizQuestions[j].score === 0) {
        					res = '<span class="mqq-wrong">' + quizQuestions[j].score;
        			} else {
        				res = '<span class="mqq-correct">' + quizQuestions[j].score;
        			}
        			var resultHTML = '<div class="mqq-result-question"><span>' + x.txtQuestion + ' ' + quizQuestions[j].id + '</span> &nbsp;' + quizQuestions[j].question + '</div>';
        			if (showSolutionBtn === "true") {
        			  // Format answer display: array for MC, string for SC
        			  var answerDisplay = Array.isArray(quizQuestions[j].answer)
        			    ? quizQuestions[j].answer.join(", ")
        			    : quizQuestions[j].answer;
        			  resultHTML += '<div class="mqq-result-answer" style="display:none;">' + x.txtCorrectAnswer + ': &nbsp;<span>' + answerDisplay + '</span></div>';
        			}
        			resultHTML += '<div class="mqq-last-row">' + x.txtScore + ': &nbsp;' + res + '</span></div>';
        			quizBody.insertAdjacentHTML('beforeend', resultHTML);
        		}

            // add user-specific CSS (scoped to this widget)
            styleAll('.mqq-res-header', {
              color: mainCol,
              fontFamily: fontFamily,
              fontSize: fontSize*1.75+'px',
              lineHeight: fontSize*1.75+'px',
              marginBottom: fontSize*0.9375+'px',
              paddingBottom: fontSize*0.9375+'px'
            });
            styleAll('.mqq-result-question', {
              color: mainCol,
              fontSize: fontSize+'px',
              lineHeight: fontSize*1.25+'px'
            });
            styleAll('.mqq-result-answer', {
              color: mainCol,
              fontSize: fontSize+'px',
              lineHeight: fontSize*1.25+'px',
              backgroundColor: x.solutionAreaBg || '#D6EAF8',
              border: '1px solid ' + (x.solutionAreaBorder || '#3498DB'),
              borderRadius: '4px',
              padding: fontSize*0.5+'px ' + fontSize*0.75+'px',
              marginTop: fontSize*0.25+'px'
            });
            styleAll('.mqq-last-row', {
              color: mainCol,
              fontSize: fontSize+'px',
              lineHeight: fontSize*1.25+'px',
              marginBottom: fontSize*0.9375+'px',
              paddingBottom: fontSize*0.9375+'px'
            });
            styleAll('.mqq-wrong', {marginLeft: fontSize*1.25+'px'});
            styleAll('.mqq-correct', {marginLeft: fontSize*1.25+'px'});


            // Button row: Try again (left) and Show solution (right)
            var buttonRow = document.createElement("div");
            buttonRow.style.display = "flex";
            buttonRow.style.flexWrap = "wrap";
            buttonRow.style.gap = "8px";
            buttonRow.style.justifyContent = "flex-start";
            buttonRow.style.alignItems = "center";
            buttonRow.style.marginTop = fontSize*0.5+'px';
            quizBody.appendChild(buttonRow);

            // Add reload button (left)
            var buttonTryagain = document.createElement("button");
            buttonTryagain.name = "tryagain";
            buttonTryagain.classList.add("mqq-btn", "mqq-tryagain");
            buttonTryagain.setAttribute('tabindex', '0');
            buttonTryagain.innerHTML = x.txtTryAgain;
            buttonTryagain.style.fontFamily = fontFamily;
            buttonTryagain.style.fontSize = fontSize+'px';
            buttonTryagain.style.lineHeight = fontSize*1.375+'px';
            buttonTryagain.style.padding = fontSize*0.375+'px ' + fontSize*0.75+'px';
            buttonTryagain.style.borderRadius = fontSize*0.25+'px';
            buttonTryagain.style.color = x.navBtnCol;
            buttonTryagain.style.backgroundColor = x.navBtnBg;
            buttonTryagain.style.borderColor = x.navBtnBg;
            buttonRow.appendChild(buttonTryagain);
            buttonTryagain.addEventListener('click', function() {
                location.reload(true);
            });

            // Add "Show solution" button (next to Try again, only if showSolutionBtn is true)
            if (showSolutionBtn === "true") {
              var buttonSolution = document.createElement("button");
              buttonSolution.name = "showsolution";
              buttonSolution.classList.add("mqq-btn", "mqq-showsolution");
              buttonSolution.setAttribute('tabindex', '0');
              buttonSolution.innerHTML = x.txtShowSolution;
              buttonSolution.style.fontFamily = fontFamily;
              buttonSolution.style.fontSize = fontSize+'px';
              buttonSolution.style.lineHeight = fontSize*1.375+'px';
              buttonSolution.style.padding = fontSize*0.375+'px ' + fontSize*0.75+'px';
              buttonSolution.style.borderRadius = fontSize*0.25+'px';
              buttonSolution.style.color = x.solutionBtnCol;
              buttonSolution.style.backgroundColor = x.solutionBtnBg;
              buttonSolution.style.border = '1px solid ' + x.solutionBtnCol;
              buttonSolution.setAttribute('aria-expanded', 'false');
              buttonRow.appendChild(buttonSolution);
              buttonSolution.addEventListener('click', function() {
                var answerRows = widgetEl.querySelectorAll('.mqq-result-answer');
                var isVisible = answerRows[0] && answerRows[0].style.display !== 'none';
                answerRows.forEach(function(row) {
                  row.style.display = isVisible ? 'none' : '';
                });
                buttonSolution.innerHTML = isVisible ? x.txtShowSolution : x.txtHideSolution;
                buttonSolution.setAttribute('aria-expanded', isVisible ? 'false' : 'true');
              });
            }

          };


          // Function that starts the timer
          if (inclTimer === "true") {
            var timeInt;
            this.startTimer = function() {
              var tobj = widgetEl.querySelector('.mqq-timer');
              var t = "0:00";
              var s = 00;
              var d = new Date();
              timeInt = setInterval(function () {
                s += 1;
                d.setMinutes("0");
                d.setSeconds(s);
                min = d.getMinutes();
                sec = d.getSeconds();
                if (sec < 10) sec = "0" + sec;
                widgetEl.querySelector('.mqq-timer').value = min + ":" + sec;
              }, 1000);
              tobj.value = t;
            }
            if (window.addEventListener) {
              window.addEventListener("load", this.startTimer);
            } else if (window.attachEvent) {
              window.attachEvent("onload", this.startTimer);
            }
          }


          // Function that checks the answers
        	this.checkAnswer = function(option) {
        		var answer = quizQuestions[this.currentque].answer;

        		if (quizType === "multiple") {
        		  // Multiple-choice: compare sets of selected values vs answer array
        		  var selected = Array.isArray(option) ? option : [option];
        		  // Escape HTML entities in selected values
        		  selected = selected.map(function(s) {
        		    return s.replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g, "&quot;");
        		  });
        		  var sortedSelected = selected.slice().sort();
        		  var sortedAnswer = answer.slice().sort();
        		  var isMatch = sortedSelected.length === sortedAnswer.length &&
        		    sortedSelected.every(function(val, idx) { return val === sortedAnswer[idx]; });
        		  if (isMatch) {
        		    if (quizQuestions[this.currentque].score == "") {
        		      quizQuestions[this.currentque].score = 1;
        		      quizQuestions[this.currentque].status = "correct";
        		    }
        		  } else {
        		    quizQuestions[this.currentque].status = "wrong";
        		  }
        		} else {
        		  // Single-choice: compare single value
        		  option = option.replace(/</g,"&lt;");
        		  option = option.replace(/>/g,"&gt;");
        		  option = option.replace(/"/g, "&quot;");

        		  if(option == quizQuestions[this.currentque].answer) {
        		  	if(quizQuestions[this.currentque].score == "") {
        		  		quizQuestions[this.currentque].score = 1;
        		  		quizQuestions[this.currentque].status = "correct";
        		    }
        		  } else {
        		  	quizQuestions[this.currentque].status = "wrong";
        		  }
        		}
        	};


          // Function that changes slides
        	this.changeQuestion = function(cque) {
        			this.currentque = this.currentque + cque;
        			this.displayQuiz(this.currentque);
        	};


        // end of quizApp wrapper function
        };


        var jsq = new quizApp();

        var selectedopt;

        // Display first question (no need for document.ready - htmlwidgets runs after DOM is ready)
        jsq.displayQuiz(0);

        // Event delegation for input changes
        widgetEl.querySelector('.mqq-option-block-container').addEventListener('change', function(e) {
          if (quizType === "multiple") {
            // Multiple-choice: collect all checked checkboxes
            if (e.target.matches('input[type=checkbox][name=option]')) {
              var checked = widgetEl.querySelectorAll('.mqq-option-block-container input[type=checkbox][name=option]:checked');
              selectedopt = [];
              checked.forEach(function(cb) { selectedopt.push(cb.value); });
            }
          } else {
            // Single-choice: single radio value
            if (e.target.matches('input[type=radio][name=option]')) {
              e.target.checked = true;
              selectedopt = e.target.value;
            }
          }
        });

      	widgetEl.querySelector('.mqq-next').addEventListener('click', function(e) {
      			e.preventDefault();
      			if(selectedopt && (Array.isArray(selectedopt) ? selectedopt.length > 0 : selectedopt !== "")) {
      				jsq.checkAnswer(selectedopt);
      			}
            // clear variable in case next question is not answered
            selectedopt = (quizType === "multiple") ? [] : "";
      			jsq.changeQuestion(1);
      	});

      	widgetEl.querySelector('.mqq-previous').addEventListener('click', function(e) {
      		e.preventDefault();
      		if(selectedopt && (Array.isArray(selectedopt) ? selectedopt.length > 0 : selectedopt !== "")) {
      			jsq.checkAnswer(selectedopt);
      		}
      			jsq.changeQuestion(-1);
      	});


      // end of renderValue Function
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
