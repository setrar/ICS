use rsrl::{
    domains::{Domain, Observation},
    fa::{QTable, Table},
    policies::{EpsilonGreedy, Policy},
    learners::{Q, SARSALearner},
    spaces::{Space, Finite},
};
use rand::thread_rng;

#[derive(Clone)]
struct SimplifiedFanorona {
    board: [i32; 9],  // A 1D board representation with 9 cells for simplicity
}

impl SimplifiedFanorona {
    fn new() -> Self {
        SimplifiedFanorona { board: [0; 9] }
    }

    fn reset(&mut self) {
        self.board = [0; 9];  // Reset the board to an empty state
    }

    fn step(&mut self, action: usize) -> (i32, bool) {
        // Perform an action (move) and get the reward
        if self.board[action] == 0 {
            self.board[action] = 1; // Agent makes a move
            let reward = if action % 2 == 0 { 1 } else { -1 };  // Reward based on position
            let done = self.board.iter().all(|&x| x != 0);  // End if board is full
            (reward, done)
        } else {
            (-1, false)  // Penalty for invalid move
        }
    }

    fn render(&self) {
        println!("{:?}", self.board);
    }
}

impl Domain for SimplifiedFanorona {
    type StateSpace = Finite;
    type ActionSpace = Finite;

    fn emit(&self) -> Observation<Self> {
        Observation::Full(self.board.iter().cloned().collect())
    }

    fn step(&mut self, action: usize) -> (Observation<Self>, f64, bool) {
        let (reward, done) = self.step(action);
        (self.emit(), reward as f64, done)
    }

    fn state_space(&self) -> Self::StateSpace {
        Finite::new(9)  // 9 cells on the board
    }

    fn action_space(&self) -> Self::ActionSpace {
        Finite::new(9)  // 9 possible moves
    }
}

fn main() {
    let mut rng = thread_rng();
    let mut env = SimplifiedFanorona::new();

    // Initialize Q-table and policy
    let q_table = QTable::new(env.state_space(), env.action_space());
    let policy = EpsilonGreedy::new(q_table.clone(), 0.1);  // 10% exploration

    // Initialize the RL learner (SARSA algorithm)
    let mut learner = SARSALearner::new(q_table, policy, 0.1, 0.99);  // Learning rate and discount

    // Training loop
    for episode in 0..100 {
        env.reset();
        let mut total_reward = 0.0;

        loop {
            let action = learner.sample(&mut rng, env.emit());
            let (obs, reward, done) = env.step(action);
            learner.handle_transition(obs, action, reward, env.emit());

            total_reward += reward;
            if done {
                break;
            }
        }
        println!("Episode {}: Total Reward = {}", episode, total_reward);
    }

    println!("Training complete.");
}

