# Fanorona


# References
To create a new Rust project, you can use the `cargo` command-line tool, which is Rust’s package manager and build system. Here’s the command to generate a new project:

```bash
cargo new project_name
```

Replace `project_name` with the desired name for your project.

For example:

```bash
cargo new fanorona_rl
```

This will create a new directory called `fanorona_rl` with the following structure:

```
fanorona_rl
├── Cargo.toml    # Project configuration file
└── src
    └── main.rs   # Main source file
```

### Explanation of the Project Structure

- **Cargo.toml**: The manifest file where you define your project’s dependencies, metadata, and build instructions.
- **src/main.rs**: The main Rust source file where you’ll write your code. This file will contain the entry point for your application.

### Commands to Build and Run the Project

1. **Navigate to the project directory**:

   ```bash
   cd fanorona_rl
   ```

2. **Build the project**:

   ```bash
   cargo build
   ```

3. **Run the project**:

   ```bash
   cargo run
   ```

4. **Test the project** (if you have tests):

   ```bash
   cargo test
   ```

This setup provides a simple starting point for developing your project in Rust. You can add dependencies to `Cargo.toml` as needed for reinforcement learning, board games, or other functionalities.
