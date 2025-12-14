import tkinter
import customtkinter
import clips

class App(customtkinter.CTk):
    question_label = None
    final_answer = None
    final_answer_label = None
    answers_box = None
    next_button = None
    quit_button = None
    checkboxes = []
    answers_box_list = []


    def __init__(self):
        super().__init__()

        self.title('Should I Buy My Kid A Phone')

        self.env = clips.Environment()
        self.env.load('rules.clp')

        self.selected_checkbox = tkinter.IntVar()

        self.setup_controls()
        self.setup()


    def setup_controls(self):
        self.load_answers_box()
        self.load_next_button()


    def setup(self):
        self.env.assert_string('(Start)')
        self.show_all()


    def show_all(self):
        self.env.run()

        for fact in self.env.facts():
            if fact.template.name == 'pytanie':
                self.question_string = fact[0]
                self.show_question(fact[0])
                
            if fact.template.name == 'odpowiedzi':
                self.answers_list = [fact[x] for x in range(0, len(fact))]
                self.show_answers(self.answers_list)
            
            if fact.template.name == 'ostateczna_odpowiedz':
                self.load_exit_button()
                self.show_final_answer(fact[0], fact[1])


    def show_question(self, question):
        if self.question_label is None:
            self.question_label = customtkinter.CTkLabel(
                master=self, text=question
            )
            self.question_label.grid(
                row=0, column=0, columnspan=3, padx=20, pady=20
            )
        
        self.question_label.configure(text=question)


    def show_answers(self, answers):
        if self.next_button is None:
            return
        self.next_button.configure(state="disabled")

        self.selected_checkbox.set(-1)

        for checkbox in self.checkboxes:
            checkbox.grid_forget()
            checkbox.destroy()

        self.checkboxes = []

        for i in range(len(answers)):
            self.checkboxes.append(
                customtkinter.CTkRadioButton(
                    master=self.answers_box,
                    text=answers[i],
                    value=i,
                    variable=self.selected_checkbox,
                    command=self.checkbox_selected
                )
            )
            self.checkboxes[-1].grid(
                row=i,
                column=0,
                pady=(0, 10),
                padx=10,
                sticky='new'
            )

        self.checkboxes[0].grid(pady=10)

    
    def show_final_answer(self, answer, answer_label):
        if self.next_button is not None:
            self.next_button.destroy()
            self.next_button = None
        
        if self.answers_box is not None:
            self.answers_box.destroy()
            self.answers_box = None

        if self.question_label is not None:
            self.question_label.destroy()
            self.question_label = None

        if self.final_answer is None:
            self.final_answer = customtkinter.CTkLabel(
                master=self, text=answer, text_color='red', font=(None, 30, 'bold')
            )
            self.final_answer.grid(
                row=1, column=0, columnspan=3, padx=20, pady=20
            )

        if self.final_answer_label is None:
            self.final_answer_label = customtkinter.CTkLabel(
                master=self, text=answer_label,
            )
            self.final_answer_label.grid(
                row=2, column=0, columnspan=3, padx=10, pady=5
            )


    def checkbox_selected(self):
        if self.next_button is not None:
            self.next_button.configure(state="standard")


    def load_next_button(self):
        if self.next_button is None:
            self.next_button = customtkinter.CTkButton(
                master=self, command=self.next_button_callback, text='Next'
            )
            self.next_button.grid(
                row=2, column=1, padx=20, pady=20, sticky='ew'
            )


    def load_exit_button(self):
        if self.quit_button is None:
            self.quit_button = customtkinter.CTkButton(
                master=self, command=self.exit_button_callback, text='Exit', fg_color='red', hover_color='red'
            )
            self.quit_button.grid(
                row=3, column=1, padx=20, pady=20, sticky='ew'
            )


    def load_answers_box(self):
        if self.answers_box is None:
            self.answers_box = customtkinter.CTkFrame(master=self)
            self.answers_box.grid_rowconfigure(0, weight=1)
            self.answers_box.grid_columnconfigure(0, weight=1)
            self.answers_box.grid(row=1, column=0, columnspan=3,
                              padx=20, pady=20, sticky="ew")
            self.answers_box.configure()


    def exit_button_callback(self):
        self.quit()


    def next_button_callback(self):
        self.env.assert_string(f'(odpowiedz "{self.answers_list[self.selected_checkbox.get()]}")')
        self.show_all()


if __name__ == "__main__":
    app = App()
    app.mainloop()